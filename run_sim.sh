#!/bin/bash

# ==============================================================================
# VHDL Simulation Script
# ==============================================================================
# To run a different testbench, change the TB_NAME variable below
# Example: TB_NAME="tb_adder" or TB_NAME="tb_mycomponent"
# ==============================================================================

# ===== CONFIGURATION - Change this to run different testbenches =====
TB_NAME="tb_adder"              # Change this to your testbench name (without .vhd)
STOP_TIME="50ns"                # Simulation stop time
MODULES_DIR="moduels"           # Directory containing module files
TESTBENCHES_DIR="testbenches"   # Directory containing testbench files
WORK_DIR="work"                 # Directory for all generated files
# =====================================================================

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_error() {
    echo -e "${RED}Error: $1${NC}"
}

print_success() {
    echo -e "${GREEN}$1${NC}"
}

print_info() {
    echo -e "${YELLOW}$1${NC}"
}

# Check if GHDL is installed
if ! command -v ghdl &> /dev/null; then
    print_error "GHDL is not installed. Please install GHDL first."
    exit 1
fi

# Check if gtkwave is installed
if ! command -v gtkwave &> /dev/null; then
    print_error "gtkwave is not installed. Please install gtkwave to view waveforms."
    print_info "Continuing without waveform viewer..."
    GTKWAVE_AVAILABLE=false
else
    GTKWAVE_AVAILABLE=true
fi

# Create work directory if it doesn't exist
mkdir -p "$WORK_DIR"

# Check if testbench file exists
TB_FILE="$TESTBENCHES_DIR/${TB_NAME}.vhd"
if [ ! -f "$TB_FILE" ]; then
    print_error "Testbench file not found: $TB_FILE"
    exit 1
fi

print_info "=========================================="
print_info "VHDL Simulation Script"
print_info "=========================================="
print_info "Testbench: $TB_NAME"
print_info "Work directory: $WORK_DIR"
print_info "=========================================="
echo ""

# Change to work directory for compilation
cd "$WORK_DIR" || exit 1

# Step 1: Compile all module files
print_info "Step 1: Compiling module files..."
MODULE_FILES=$(find ../$MODULES_DIR -name "*.vhd" 2>/dev/null)
if [ -z "$MODULE_FILES" ]; then
    print_error "No VHDL module files found in $MODULES_DIR/"
    exit 1
fi

COMPILE_ERROR=false
for MODULE_FILE in $MODULE_FILES; do
    print_info "  Compiling: $MODULE_FILE"
    ghdl -a "$MODULE_FILE" 2>&1
    if [ $? -ne 0 ]; then
        print_error "Failed to compile $MODULE_FILE"
        COMPILE_ERROR=true
    fi
done

if [ "$COMPILE_ERROR" = true ]; then
    print_error "Module compilation failed. Exiting."
    exit 1
fi

print_success "Module files compiled successfully."
echo ""

# Step 2: Compile testbench
print_info "Step 2: Compiling testbench..."
TB_PATH="../$TB_FILE"
print_info "  Compiling: $TB_PATH"
ghdl -a "$TB_PATH" 2>&1
if [ $? -ne 0 ]; then
    print_error "Failed to compile testbench: $TB_PATH"
    exit 1
fi

print_success "Testbench compiled successfully."
echo ""

# Step 3: Elaborate testbench
print_info "Step 3: Elaborating testbench..."
ghdl -e "$TB_NAME" 2>&1
if [ $? -ne 0 ]; then
    print_error "Failed to elaborate testbench: $TB_NAME"
    exit 1
fi

print_success "Testbench elaborated successfully."
echo ""

# Step 4: Run simulation
print_info "Step 4: Running simulation..."
VCD_FILE="${TB_NAME}.vcd"
print_info "  Stop time: $STOP_TIME"
print_info "  Output VCD: $VCD_FILE"

ghdl -r "$TB_NAME" --vcd="$VCD_FILE" --stop-time="$STOP_TIME" 2>&1
if [ $? -ne 0 ]; then
    print_error "Simulation failed."
    exit 1
fi

print_success "Simulation completed successfully."
echo ""

# Step 5: Open gtkwave
if [ "$GTKWAVE_AVAILABLE" = true ]; then
    print_info "Step 5: Opening gtkwave..."
    print_info "  Waveform file: $WORK_DIR/$VCD_FILE"
    
    # Run gtkwave in background so script can continue
    gtkwave "$VCD_FILE" &
    print_success "gtkwave opened."
else
    print_info "Step 5: Skipping waveform viewer (gtkwave not installed)"
    print_info "  To view waveform manually, run: gtkwave $WORK_DIR/$VCD_FILE"
fi

echo ""
print_info "=========================================="
print_success "All done! Files are in: $WORK_DIR/"
print_info "=========================================="
print_info "Generated files:"
print_info "  - $VCD_FILE (waveform)"
print_info "  - *.o, *.cf (compiled files)"
print_info "  - $TB_NAME (executable)"
print_info "=========================================="

# Return to original directory
cd .. || exit 1
