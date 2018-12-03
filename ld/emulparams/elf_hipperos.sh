# If you change this file, please also look at files which source this one:
# aarch64hipperos.sh aarch64hipperosb.sh armelf_hipperos.sh armelfb_hipperos.sh

unset STACK_ADDR

# Add a page and then align.
# This ensures that we have an empty page.
RODATA_FULL_ADDR=". + ${MAXPAGESIZE};\
 . = ALIGN (${MAXPAGESIZE})"

DATA_SEGMENT_ALIGN=". + ${MAXPAGESIZE};\
 . = ALIGN (${MAXPAGESIZE})"
DATA_SEGMENT_END=""
DATA_SEGMENT_RELRO_END=""
