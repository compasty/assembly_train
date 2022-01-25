# 概述

本项目是X86_64的汇编学习的记录，主要参考 《X86汇编语言-从实模式到保护模式》, [Linux Assembly](https://www.youtube.com/watch?v=VQAKkuLL31g)。

# 目录结构

├─README.md
├─toyos
|   └simple.s
├─linux
|   └bootsec.s
├─basic
|   ├─tutorial4-asm-debug
|   ├─tutorial3
|   |     ├─README.md
|   |     └jump.s
|   ├─tutorial2
|   |     ├─README.md
|   |     └calculate.s
|   ├─tutorial1
|   |     ├─README.md
|   |     ├─hello.s
|   |     ├─macos
|   |     |   └hello.s
|   |     ├─img
|   |     |  └1.png


# NASM

NASM全称 `Netwide Asssembler`, 是一个 `80x86` 和 `x86-64`汇编器，基于简化版BSD许可证的开放源代码软件。NASM支持多种目标文件格式，如 `a.out`, `ELF`, `Mach-O` `.obj`(OMF), `coff`等， 也支持常见的二进制输出格式。

> NASM不是AT&T风格汇编（GNU汇编器采用的语法），而是Intel风格

## 命令行语法

`nasm -f <format> <filename> [-o <output>]`

例如： `name -f elf myfile.asm` 这个指令会生成 `ELF`格式的文件 `myfile.o`, `nasm -f bin myfile.asm -o myfile.com`则是生成原始的二进制文件 `myfile.com`。
