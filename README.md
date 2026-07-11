# 32-bit x86 Custom Operating System

A bare-metal 32-bit x86 operating system written in **C** and **NASM Assembly**.

This project was developed as a university systems-programming project and demonstrates low-level operating-system concepts including protected-mode initialization, interrupt handling, paging, heap allocation, hardware timers, keyboard input, VGA text output, PC speaker audio, an interactive shell, and a playable Snake game.

## Demo

```md
![Custom OS running in QEMU](https://github.com/adskeie/x86-custom-os/blob/main/screenshots/os-demo.png?raw=true)
```

## Features

- Multiboot-compatible startup
- 32-bit x86 protected mode
- Global Descriptor Table (GDT)
- Interrupt Descriptor Table (IDT)
- CPU exception handling
- Hardware IRQ handling
- Programmable Interrupt Controller (PIC) remapping
- PS/2 keyboard driver
- VGA text-mode terminal
- Terminal scrolling and cursor handling
- Kernel heap allocation with `malloc` and `free`
- Page-aligned memory allocation
- Basic paging and identity mapping
- Programmable Interval Timer (PIT)
- Busy-wait and interrupt-driven sleep
- PC speaker audio
- Minimal `printf` implementation
- Interactive command shell
- Playable Snake game

## Shell Commands

After booting, the operating system starts an interactive shell.

Available commands include:

| Command | Description |
|---|---|
| `help` | Display available commands |
| `clear` | Clear the terminal |
| `snake` | Start the Snake game |
| `play music` | Play songs through the PC speaker |
| `test_sleep` | Test busy-wait and interrupt-driven sleep |
| `test_malloc` | Test kernel heap allocation |

Inside Snake, use:

| Key | Action |
|---|---|
| `W` | Move up |
| `A` | Move left |
| `S` | Move down |
| `D` | Move right |

## Architecture

The startup flow is approximately:

```text
GRUB / Multiboot
      |
      v
Assembly boot entry
      |
      v
C kernel entry
      |
      +--> Initialize GDT
      +--> Initialize IDT
      +--> Install IRQ handlers
      +--> Initialize VGA terminal
      +--> Install keyboard driver
      +--> Initialize kernel heap
      +--> Enable paging
      +--> Initialize PIT
      +--> Enable interrupts
      |
      v
Interactive shell
```

## Project Structure

```text
.
├── arch/
│   └── x86/          # Architecture-specific assembly
├── include/          # Header files
├── src/              # Kernel and driver source code
├── grub/             # GRUB configuration
├── screenshots/      # Screenshots and demo images
├── Makefile
├── linker.ld
├── README.md
└── LICENSE
```

The exact structure may differ slightly depending on how the source files are organized.

## Requirements

On an Arch Linux-based system:

```bash
sudo pacman -S --needed base-devel nasm qemu-system-x86 grub xorriso mtools
```

You may also need 32-bit compilation support or an `i686-elf` cross-compiler, depending on the Makefile.

Required tools generally include:

- GCC or `i686-elf-gcc`
- GNU Binutils
- NASM
- GNU Make
- GRUB utilities
- QEMU
- xorriso
- mtools

## Build

Clone the repository:

```bash
git clone git@github.com:adskeie/x86-custom-os.git
cd x86-custom-os
```

Build the operating system:

```bash
make
```

## Run

Start the operating system in QEMU:

```bash
make run
```

If the Makefile does not include a `run` target, run the generated ISO manually:

```bash
qemu-system-i386 -cdrom kernel.iso
```

Replace `kernel.iso` with the actual output filename if necessary.

## Clean

Remove generated build files:

```bash
make clean
```

## Technologies

- C
- NASM Assembly
- x86
- GRUB / Multiboot
- GNU Make
- GCC / GNU Binutils
- QEMU
- VGA text mode
- PS/2 keyboard controller
- Programmable Interval Timer
- PC speaker

## What I Learned

This project provided practical experience with:

- Writing freestanding C without the standard library
- Calling C code from assembly
- Configuring x86 segmentation
- Building and loading descriptor tables
- Handling CPU exceptions and hardware interrupts
- Communicating with hardware through I/O ports
- Implementing a basic kernel memory allocator
- Enabling and configuring paging
- Writing timer-driven kernel functionality
- Building interactive terminal applications without an operating-system runtime
- Debugging low-level software in QEMU

## Limitations

This is an educational operating system and not a production-ready general-purpose OS.

It currently does not include:

- User-space processes
- Multitasking or scheduling
- A filesystem
- Disk drivers
- Networking
- Security isolation between programs
- A graphical user interface

## Roadmap

Possible future improvements:

- Add process scheduling and multitasking
- Add user mode and system calls
- Implement a filesystem
- Add dynamic virtual-memory management
- Improve heap reuse and fragmentation handling
- Add serial-port debugging
- Add automated builds with GitHub Actions
- Add unit tests for freestanding utility functions
- Add more shell commands and applications

## Author

Created by [adskeie](https://github.com/adskeie).
