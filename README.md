# 概述

本项目是X86_64的汇编学习的记录，主要参考 《X86汇编语言-从实模式到保护模式》, [Linux Assembly](https://www.youtube.com/watch?v=VQAKkuLL31g)。

# 目录结构 (使用 `mddir` 制作)

    |-- .gitignore
    |-- README.md
    |-- basic
    |   |-- tutorial1
    |   |   |-- README.md
    |   |   |-- hello.s
    |   |   |-- img
    |   |   |   |-- 1.png
    |   |   |-- macos
    |   |       |-- hello.s
    |   |-- tutorial2
    |   |   |-- README.md
    |   |   |-- calculate.s
    |   |-- tutorial3
    |   |   |-- README.md
    |   |   |-- jump.s
    |   |-- tutorial4-asm-debug
    |-- linux
    |   |-- bootsec.s
    |-- toyos
        |-- simple.s

# NASM

NASM全称 `Netwide Asssembler`, 是一个 `80x86` 和 `x86-64`汇编器，基于简化版BSD许可证的开放源代码软件。NASM支持多种目标文件格式，如 `a.out`, `ELF`, `Mach-O` `.obj`(OMF), `coff`等， 也支持常见的二进制输出格式。

> NASM不是AT&T风格汇编（GNU汇编器采用的语法），而是Intel风格

## 命令

`nasm -f <format> <filename> [-o <output>]`

例如： `name -f elf myfile.asm` 这个指令会生成 `ELF`格式的文件 `myfile.o`, `nasm -f bin myfile.asm -o myfile.com`则是生成原始的二进制文件 `myfile.com`。

## 语法

NASM源码行通常为格式: `label:   instruction operands  ;comment`, 首先是可选的标号，然后是指令，最后是注释（使用`;`）
