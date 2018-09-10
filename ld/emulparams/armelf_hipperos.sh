. ${srcdir}/emulparams/armelf.sh

# Skip the first page in order to avoid to have valid content at
# address 0.
TEXT_START_ADDR="CONSTANT (MAXPAGESIZE)"

# We use EXECUTABLE_SYMBOLS for the global definitions used in the linking script
EXECUTABLE_SYMBOLS="
/* Virtual address used by the lightweight tracing. */
_lightweight_tracing_virtual_address = 0x9000000;
"

# Define libc_fini symbol
FINI_START="
	/*
	* The definition of __libc_fini enables a check in newlib to register
	* the call to the destructors using atexit. See register_fini
	* and the --enable-newlib-register-fini option.
	*/
	__libc_fini = .;
"

# Reset OTHER_READONLY_SECTIONS to remove .ARM.exidx and .ARM.extab sections
OTHER_READONLY_SECTIONS=""

INITIAL_READONLY_SECTIONS="
  /DISCARD/ . :
  {
	* (*.ARM.exidx*)
	* (*.ARM.extab*)
  }
"

# Force data segment to be aligned on a separate page
DATA_SEGMENT_ALIGN="ALIGN( CONSTANT(MAXPAGESIZE) )"
