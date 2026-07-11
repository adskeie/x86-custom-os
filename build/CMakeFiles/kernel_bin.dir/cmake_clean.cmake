file(REMOVE_RECURSE
  "isodir"
  "obj"
  "CMakeFiles/kernel_bin"
  "kernel.bin"
  "obj/apps_musicplayer_src_song_player.o"
  "obj/apps_shell_src_shell.o"
  "obj/apps_snake_src_snake.o"
  "obj/drivers_asm_boot.o"
  "obj/drivers_asm_gdt.o"
  "obj/drivers_asm_isr.o"
  "obj/drivers_src_common.o"
  "obj/drivers_src_gdt.o"
  "obj/drivers_src_idt.o"
  "obj/drivers_src_irq.o"
  "obj/drivers_src_isr.o"
  "obj/drivers_src_keyboard.o"
  "obj/kernel_src_kernel.o"
  "obj/kernel_src_pit.o"
  "obj/kernel_src_system.o"
  "obj/kernel_src_terminal.o"
  "obj/memory_src_malloc.o"
  "obj/memory_src_memory.o"
  "obj/memory_src_memutils.o"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/kernel_bin.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
