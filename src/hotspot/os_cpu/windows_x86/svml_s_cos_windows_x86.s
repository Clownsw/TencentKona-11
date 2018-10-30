;
; Copyright (c) 2018, Intel Corporation.
; Intel Short Vector Math Library (SVML) Source Code
;
; DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
;
; This code is free software; you can redistribute it and/or modify it
; under the terms of the GNU General Public License version 2 only, as
; published by the Free Software Foundation.
;
; This code is distributed in the hope that it will be useful, but WITHOUT
; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
; version 2 for more details (a copy is included in the LICENSE file that
; accompanied this code).
;
; You should have received a copy of the GNU General Public License version
; 2 along with this work; if not, write to the Free Software Foundation,
; Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
;
; Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
; or visit www.oracle.com if you need additional information or have any
; questions.
;

INCLUDE globals_vectorApiSupport_windows.hpp
IFNB __VECTOR_API_MATH_INTRINSICS_WINDOWS
	OPTION DOTNAME

_TEXT	SEGMENT      'CODE'

TXTST0:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_cosf8_ha_e9

__svml_cosf8_ha_e9	PROC

_B1_1::

        DB        243
        DB        15
        DB        30
        DB        250
L1::

        push      rdi
        push      r15
        push      rbp
        sub       rsp, 704
        xor       ebp, ebp
        vmovups   YMMWORD PTR [368+rsp], ymm15
        vmovups   YMMWORD PTR [400+rsp], ymm14
        vmovups   YMMWORD PTR [432+rsp], ymm13
        vmovups   YMMWORD PTR [464+rsp], ymm12
        vmovups   YMMWORD PTR [496+rsp], ymm11
        vmovups   YMMWORD PTR [656+rsp], ymm10
        vmovups   YMMWORD PTR [624+rsp], ymm9
        vmovups   YMMWORD PTR [528+rsp], ymm8
        vmovups   YMMWORD PTR [560+rsp], ymm7
        vmovups   YMMWORD PTR [592+rsp], ymm6
        mov       QWORD PTR [688+rsp], r13
        lea       r13, QWORD PTR [271+rsp]
        vandps    ymm8, ymm0, YMMWORD PTR [__svml_scos_ha_data_internal+4096]
        and       r13, -64
        vaddps    ymm13, ymm8, YMMWORD PTR [__svml_scos_ha_data_internal+5504]
        vcmpnle_uqps ymm1, ymm8, YMMWORD PTR [__svml_scos_ha_data_internal+4160]
        vmovups   ymm10, YMMWORD PTR [__svml_scos_ha_data_internal+5440]
        vmulps    ymm2, ymm13, YMMWORD PTR [__svml_scos_ha_data_internal+5376]
        vaddps    ymm4, ymm10, ymm2
        mov       QWORD PTR [696+rsp], r13
        vpslld    xmm3, xmm4, 31
        vsubps    ymm11, ymm4, ymm10
        vextractf128 xmm5, ymm4, 1
        vmovupd   ymm4, YMMWORD PTR [__svml_scos_ha_data_internal+4992]
        vpslld    xmm9, xmm5, 31
        vsubps    ymm12, ymm11, YMMWORD PTR [__svml_scos_ha_data_internal+5568]
        vmovupd   ymm11, YMMWORD PTR [__svml_scos_ha_data_internal+5056]
        vcvtps2pd ymm5, xmm12
        vextractf128 xmm14, ymm12, 1
        vmulpd    ymm2, ymm5, ymm4
        vmulpd    ymm5, ymm5, ymm11
        vcvtps2pd ymm6, xmm14
        vcvtps2pd ymm13, xmm8
        vextractf128 xmm15, ymm8, 1
        vsubpd    ymm10, ymm13, ymm2
        vinsertf128 ymm7, ymm3, xmm9, 1
        vmulpd    ymm9, ymm6, ymm4
        vmulpd    ymm6, ymm6, ymm11
        vmovupd   ymm11, YMMWORD PTR [__svml_scos_ha_data_internal+5184]
        vcvtps2pd ymm3, xmm15
        vmovupd   ymm15, YMMWORD PTR [__svml_scos_ha_data_internal+5312]
        vsubpd    ymm4, ymm10, ymm5
        vsubpd    ymm12, ymm3, ymm9
        vmovupd   ymm5, YMMWORD PTR [__svml_scos_ha_data_internal+5248]
        vmulpd    ymm13, ymm4, ymm4
        vsubpd    ymm2, ymm12, ymm6
        vmulpd    ymm14, ymm15, ymm13
        vmulpd    ymm3, ymm2, ymm2
        vaddpd    ymm6, ymm5, ymm14
        vmulpd    ymm15, ymm15, ymm3
        vmulpd    ymm9, ymm13, ymm6
        vmovupd   ymm6, YMMWORD PTR [__svml_scos_ha_data_internal+5120]
        vaddpd    ymm10, ymm5, ymm15
        vaddpd    ymm14, ymm11, ymm9
        vmulpd    ymm12, ymm3, ymm10
        vmulpd    ymm14, ymm13, ymm14
        vaddpd    ymm5, ymm11, ymm12
        vaddpd    ymm10, ymm6, ymm14
        vmulpd    ymm9, ymm3, ymm5
        vmulpd    ymm13, ymm13, ymm10
        vaddpd    ymm11, ymm6, ymm9
        vmulpd    ymm5, ymm3, ymm11
        vmulpd    ymm3, ymm4, ymm13
        vaddpd    ymm13, ymm4, ymm3
        vmulpd    ymm4, ymm2, ymm5
        vpxor     xmm5, xmm5, xmm5
        vaddpd    ymm3, ymm2, ymm4
        vcvtpd2ps xmm2, ymm13
        vcvtpd2ps xmm13, ymm3
        vinsertf128 ymm4, ymm2, xmm13, 1
        vxorps    ymm13, ymm4, ymm7
        vextractf128 xmm7, ymm1, 1
        vpackssdw xmm2, xmm1, xmm7
        vpacksswb xmm3, xmm2, xmm5
        vpmovmskb eax, xmm3
        test      al, al
        jne       _B1_12

_B1_2::

        test      bpl, bpl
        jne       _B1_4

_B1_3::

        vmovaps   ymm0, ymm13
        vmovups   ymm6, YMMWORD PTR [592+rsp]
        vmovups   ymm7, YMMWORD PTR [560+rsp]
        vmovups   ymm8, YMMWORD PTR [528+rsp]
        vmovups   ymm9, YMMWORD PTR [624+rsp]
        vmovups   ymm10, YMMWORD PTR [656+rsp]
        vmovups   ymm11, YMMWORD PTR [496+rsp]
        vmovups   ymm12, YMMWORD PTR [464+rsp]
        vmovups   ymm13, YMMWORD PTR [432+rsp]
        vmovups   ymm14, YMMWORD PTR [400+rsp]
        vmovups   ymm15, YMMWORD PTR [368+rsp]
        mov       r13, QWORD PTR [688+rsp]
        add       rsp, 704
        pop       rbp
        pop       r15
        pop       rdi
        ret

_B1_4::

        vmovups   YMMWORD PTR [r13], ymm0
        vmovups   YMMWORD PTR [64+r13], ymm13
        test      ebp, ebp
        je        _B1_3

_B1_7::

        xor       edi, edi

_B1_8::

        bt        ebp, edi
        jc        _B1_11

_B1_9::

        inc       edi
        cmp       edi, 8
        jl        _B1_8

_B1_10::

        vmovups   ymm13, YMMWORD PTR [64+r13]
        jmp       _B1_3

_B1_11::

        vzeroupper
        lea       rcx, QWORD PTR [r13+rdi*4]
        lea       rdx, QWORD PTR [64+r13+rdi*4]

        call      __svml_scos_ha_cout_rare_internal
        jmp       _B1_9

_B1_12::

        vmovups   ymm2, YMMWORD PTR [__svml_scos_ha_data_internal+4224]
        mov       edx, 2139095040
        vmovups   YMMWORD PTR [64+r13], ymm13
        vmovups   YMMWORD PTR [r13], ymm0
        vmovups   YMMWORD PTR [32+r13], ymm1
        vmovd     xmm7, edx
        vpshufd   xmm13, xmm7, 0
        vandps    ymm4, ymm2, ymm8
        lea       rax, QWORD PTR [__ImageBase]
        vcmpeqps  ymm3, ymm4, ymm2
        vpand     xmm6, xmm13, xmm0
        vextractf128 xmm15, ymm0, 1
        vpsrld    xmm10, xmm6, 23
        vpslld    xmm9, xmm10, 1
        vpaddd    xmm14, xmm9, xmm10
        vpand     xmm1, xmm13, xmm15
        vpsrld    xmm4, xmm1, 23
        vmovups   XMMWORD PTR [32+rsp], xmm0
        vmovups   XMMWORD PTR [48+rsp], xmm15
        vextractf128 xmm12, ymm3, 1
        vpackssdw xmm11, xmm3, xmm12
        vpslld    xmm3, xmm14, 2
        vpacksswb xmm8, xmm11, xmm5
        vpslld    xmm5, xmm4, 1
        vmovd     ecx, xmm3
        vpaddd    xmm2, xmm5, xmm4
        vpslld    xmm6, xmm2, 2
        vmovd     r10d, xmm6
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+rcx]
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+rcx]
        vpextrd   r8d, xmm3, 2
        vpextrd   edi, xmm3, 1
        vpextrd   r9d, xmm3, 3
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+r8]
        vpextrd   r15d, xmm6, 2
        vpmovmskb ebp, xmm8
        vmovd     xmm13, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+r10]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+r15]
        vpinsrd   xmm8, xmm12, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+rdi], 1
        vpinsrd   xmm7, xmm11, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+r9], 1
        vpinsrd   xmm3, xmm14, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+rdi], 1
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+r8]
        vpinsrd   xmm12, xmm5, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+r9], 1
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+r10]
        vpunpcklqdq xmm2, xmm8, xmm7
        vmovd     xmm8, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+r15]
        vmovdqu   XMMWORD PTR [64+rsp], xmm2
        vpextrd   r11d, xmm6, 1
        vpextrd   edx, xmm6, 3
        vpinsrd   xmm9, xmm13, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+r11], 1
        vpinsrd   xmm10, xmm1, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+rdx], 1
        vpinsrd   xmm6, xmm8, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+rdx], 1
        vpinsrd   xmm7, xmm11, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+r11], 1
        vmovd     xmm1, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+rcx]
        vpinsrd   xmm14, xmm1, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+rdi], 1
        vpunpcklqdq xmm4, xmm9, xmm10
        vmovd     xmm9, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+r8]
        vpunpcklqdq xmm10, xmm3, xmm12
        vmovd     xmm3, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+r10]
        vpinsrd   xmm5, xmm9, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+r9], 1
        mov       r10d, 65535
        vpinsrd   xmm11, xmm3, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+r11], 1
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+r15]
        vpinsrd   xmm8, xmm12, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+rdx], 1
        vpunpcklqdq xmm13, xmm7, xmm6
        vmovdqu   XMMWORD PTR [80+rsp], xmm4
        vpunpcklqdq xmm1, xmm14, xmm5
        mov       r15d, 8388607
        mov       r11d, 8388608
        vpunpcklqdq xmm3, xmm11, xmm8
        vpsrld    xmm11, xmm10, 16
        vpsrld    xmm8, xmm13, 16
        mov       r9d, -2147483648
        vmovdqu   XMMWORD PTR [144+rsp], xmm8
        mov       r8d, 1065353216
        vmovd     xmm7, r15d
        vmovd     xmm6, r11d
        vpshufd   xmm9, xmm7, 0
        mov       r15d, 262143
        vpshufd   xmm5, xmm6, 0
        vpand     xmm0, xmm9, xmm0
        vpaddd    xmm14, xmm0, xmm5
        vpand     xmm15, xmm9, xmm15
        vmovd     xmm0, r10d
        vpaddd    xmm6, xmm15, xmm5
        vpshufd   xmm15, xmm0, 0
        mov       ecx, 679477248
        vpand     xmm7, xmm2, xmm15
        vpand     xmm9, xmm14, xmm15
        vpand     xmm5, xmm10, xmm15
        vpsrld    xmm2, xmm1, 16
        vpsrld    xmm10, xmm14, 16
        vpand     xmm12, xmm4, xmm15
        vmovdqu   XMMWORD PTR [96+rsp], xmm7
        vpand     xmm14, xmm6, xmm15
        vpmulld   xmm7, xmm9, xmm7
        vpand     xmm0, xmm13, xmm15
        vmovdqu   XMMWORD PTR [176+rsp], xmm7
        vpand     xmm1, xmm1, xmm15
        vpmulld   xmm7, xmm10, xmm2
        vpsrld    xmm13, xmm6, 16
        vpmulld   xmm2, xmm9, xmm2
        vpsrld    xmm4, xmm3, 16
        vmovdqu   XMMWORD PTR [112+rsp], xmm12
        vpsrld    xmm2, xmm2, 16
        vpmulld   xmm12, xmm14, xmm12
        vpaddd    xmm7, xmm7, xmm2
        vmovdqu   XMMWORD PTR [160+rsp], xmm0
        vpand     xmm3, xmm3, xmm15
        vmovdqu   XMMWORD PTR [192+rsp], xmm12
        mov       edi, 255
        vpmulld   xmm12, xmm14, xmm8
        mov       r11d, 872415232
        vpmulld   xmm6, xmm9, xmm5
        mov       r10d, 511
        vpmulld   xmm8, xmm14, xmm0
        vpmulld   xmm0, xmm10, xmm1
        vpsrld    xmm1, xmm0, 16
        vpand     xmm0, xmm6, xmm15
        vpaddd    xmm0, xmm0, xmm7
        vpsrld    xmm6, xmm6, 16
        vpaddd    xmm7, xmm1, xmm0
        vpand     xmm1, xmm8, xmm15
        vpmulld   xmm0, xmm13, xmm3
        vpsrld    xmm8, xmm8, 16
        vpmulld   xmm3, xmm13, xmm4
        vpsrld    xmm0, xmm0, 16
        vpmulld   xmm4, xmm14, xmm4
        vpsrld    xmm4, xmm4, 16
        vpaddd    xmm2, xmm3, xmm4
        vmovdqu   XMMWORD PTR [128+rsp], xmm11
        vpaddd    xmm3, xmm1, xmm2
        vpmulld   xmm11, xmm9, xmm11
        vpaddd    xmm4, xmm0, xmm3
        vpmulld   xmm1, xmm10, xmm5
        vpand     xmm0, xmm11, xmm15
        vpaddd    xmm3, xmm1, xmm6
        vpsrld    xmm2, xmm7, 16
        vpmulld   xmm5, xmm13, XMMWORD PTR [160+rsp]
        vpaddd    xmm0, xmm0, xmm3
        vpaddd    xmm6, xmm2, xmm0
        vpand     xmm0, xmm12, xmm15
        vpaddd    xmm2, xmm5, xmm8
        vpsrld    xmm3, xmm4, 16
        vpaddd    xmm8, xmm0, xmm2
        vpsrld    xmm11, xmm11, 16
        vpmulld   xmm1, xmm10, XMMWORD PTR [128+rsp]
        vpaddd    xmm8, xmm3, xmm8
        vmovdqu   xmm3, XMMWORD PTR [176+rsp]
        vpaddd    xmm2, xmm1, xmm11
        vpand     xmm0, xmm3, xmm15
        vpsrld    xmm5, xmm6, 16
        vpaddd    xmm0, xmm0, xmm2
        vpsrld    xmm12, xmm12, 16
        vpmulld   xmm2, xmm13, XMMWORD PTR [144+rsp]
        vpaddd    xmm0, xmm5, xmm0
        vmovdqu   xmm5, XMMWORD PTR [192+rsp]
        vpaddd    xmm2, xmm2, xmm12
        vpand     xmm11, xmm5, xmm15
        vpsrld    xmm1, xmm8, 16
        vpaddd    xmm12, xmm11, xmm2
        vpsrld    xmm3, xmm3, 16
        vmovdqu   xmm11, XMMWORD PTR [64+rsp]
        vpaddd    xmm2, xmm1, xmm12
        vpsrld    xmm1, xmm11, 16
        vpsrld    xmm12, xmm0, 16
        vpmulld   xmm10, xmm10, XMMWORD PTR [96+rsp]
        vpand     xmm0, xmm0, xmm15
        vpmulld   xmm9, xmm9, xmm1
        vpaddd    xmm11, xmm10, xmm3
        vpand     xmm9, xmm9, xmm15
        vpand     xmm7, xmm7, xmm15
        vpaddd    xmm1, xmm9, xmm11
        vpslld    xmm6, xmm6, 16
        vpaddd    xmm12, xmm12, xmm1
        vpsrld    xmm1, xmm2, 16
        vmovdqu   xmm3, XMMWORD PTR [80+rsp]
        vpslld    xmm9, xmm12, 16
        vpaddd    xmm10, xmm9, xmm0
        vpsrld    xmm0, xmm3, 16
        vpmulld   xmm13, xmm13, XMMWORD PTR [112+rsp]
        vpand     xmm2, xmm2, xmm15
        vpmulld   xmm14, xmm14, xmm0
        vpsrld    xmm0, xmm5, 16
        vpand     xmm3, xmm14, xmm15
        vpaddd    xmm12, xmm13, xmm0
        vpaddd    xmm11, xmm3, xmm12
        vpand     xmm15, xmm4, xmm15
        vpaddd    xmm13, xmm1, xmm11
        vmovd     xmm4, r9d
        vpshufd   xmm14, xmm4, 0
        vpslld    xmm1, xmm13, 16
        vmovd     xmm5, r8d
        vpaddd    xmm1, xmm1, xmm2
        vpand     xmm2, xmm14, XMMWORD PTR [32+rsp]
        vpslld    xmm8, xmm8, 16
        vpshufd   xmm11, xmm5, 0
        vpsrld    xmm0, xmm10, 9
        vmovups   ymm13, YMMWORD PTR [_2il0floatpacket_21]
        vpxor     xmm3, xmm2, xmm11
        vpand     xmm4, xmm14, XMMWORD PTR [48+rsp]
        vpaddd    xmm9, xmm6, xmm7
        vpaddd    xmm15, xmm8, xmm15
        vpsrld    xmm8, xmm1, 9
        vpxor     xmm7, xmm4, xmm11
        vpor      xmm12, xmm0, xmm3
        vpor      xmm6, xmm8, xmm7
        vmovd     xmm11, r15d
        vmovd     xmm3, ecx
        vmovd     xmm0, edi
        vpshufd   xmm7, xmm0, 0
        vinsertf128 ymm14, ymm12, xmm6, 1
        vaddps    ymm6, ymm14, ymm13
        vpshufd   xmm12, xmm3, 0
        vpxor     xmm0, xmm2, xmm12
        vsubps    ymm5, ymm6, ymm13
        vsubps    ymm13, ymm14, ymm5
        vpxor     xmm14, xmm4, xmm12
        vpshufd   xmm5, xmm11, 0
        vpand     xmm3, xmm5, xmm9
        vpand     xmm5, xmm5, xmm15
        vpslld    xmm12, xmm3, 5
        vpslld    xmm3, xmm5, 5
        vpor      xmm11, xmm12, xmm0
        vpor      xmm12, xmm3, xmm14
        vpsrld    xmm9, xmm9, 18
        vpsrld    xmm15, xmm15, 18
        vmovups   ymm5, YMMWORD PTR [_2il0floatpacket_24]
        vinsertf128 ymm11, ymm11, xmm12, 1
        vinsertf128 ymm14, ymm0, xmm14, 1
        vmovd     xmm0, r11d
        vsubps    ymm12, ymm11, ymm14
        vpshufd   xmm11, xmm0, 0
        vpxor     xmm3, xmm2, xmm11
        vpxor     xmm2, xmm4, xmm11
        vmovd     xmm4, r10d
        vpshufd   xmm4, xmm4, 0
        vpand     xmm10, xmm4, xmm10
        vpand     xmm4, xmm4, xmm1
        vpslld    xmm0, xmm10, 14
        vpslld    xmm1, xmm4, 14
        vpor      xmm0, xmm0, xmm9
        vpor      xmm11, xmm0, xmm3
        vpor      xmm0, xmm1, xmm15
        vpor      xmm4, xmm0, xmm2
        vinsertf128 ymm1, ymm11, xmm4, 1
        vinsertf128 ymm2, ymm3, xmm2, 1
        vsubps    ymm0, ymm1, ymm2
        vaddps    ymm3, ymm13, ymm0
        vsubps    ymm4, ymm13, ymm3
        vaddps    ymm2, ymm0, ymm4
        vaddps    ymm1, ymm12, ymm2
        vmovups   ymm12, YMMWORD PTR [_2il0floatpacket_23]
        vmulps    ymm14, ymm1, YMMWORD PTR [_2il0floatpacket_22]
        vandps    ymm11, ymm3, YMMWORD PTR [_2il0floatpacket_25]
        vsubps    ymm9, ymm3, ymm11
        vmulps    ymm13, ymm5, ymm11
        vmulps    ymm0, ymm12, ymm11
        vmulps    ymm10, ymm12, ymm9
        vmulps    ymm15, ymm5, ymm9
        vmovups   ymm11, YMMWORD PTR [_2il0floatpacket_27]
        vaddps    ymm4, ymm10, ymm13
        vaddps    ymm2, ymm14, ymm15
        vaddps    ymm3, ymm4, ymm2
        vaddps    ymm5, ymm0, ymm3
        vsubps    ymm0, ymm0, ymm5
        vaddps    ymm14, ymm3, ymm0
        vmovups   ymm0, YMMWORD PTR [r13]
        vandps    ymm12, ymm0, YMMWORD PTR [_2il0floatpacket_26]
        vcmpgt_oqps ymm13, ymm12, ymm11
        vcmple_oqps ymm1, ymm12, ymm11
        vandps    ymm10, ymm13, ymm5
        vandps    ymm9, ymm1, ymm0
        vorps     ymm4, ymm9, ymm10
        vandps    ymm3, ymm13, ymm14
        vmulps    ymm2, ymm4, ymm4
        vextractf128 xmm8, ymm6, 1
        vpand     xmm6, xmm6, xmm7
        vpslld    xmm12, xmm6, 4
        vmovd     r15d, xmm12
        vpand     xmm7, xmm8, xmm7
        vpslld    xmm5, xmm7, 4
        vmovd     r8d, xmm5
        vmovd     xmm8, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+r15]
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+r15]
        vpextrd   r10d, xmm12, 2
        vpextrd   ecx, xmm5, 2
        vpextrd   r11d, xmm12, 1
        vpextrd   r9d, xmm12, 3
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+r10]
        vpextrd   edi, xmm5, 1
        vpextrd   edx, xmm5, 3
        vmovd     xmm6, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+r8]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+rcx]
        vpinsrd   xmm11, xmm8, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+r11], 1
        vpinsrd   xmm8, xmm12, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+r9], 1
        vpinsrd   xmm9, xmm6, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+rdi], 1
        vpinsrd   xmm10, xmm7, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+rdx], 1
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+r10]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+r8]
        vmovd     xmm7, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+rcx]
        vpunpcklqdq xmm1, xmm11, xmm8
        vpinsrd   xmm11, xmm14, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+r11], 1
        vpinsrd   xmm8, xmm6, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+rdi], 1
        vpunpcklqdq xmm13, xmm9, xmm10
        vmovd     xmm14, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+r10]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+r8]
        vpinsrd   xmm9, xmm7, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+rdx], 1
        vpinsrd   xmm6, xmm6, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+rdi], 1
        vpunpcklqdq xmm10, xmm8, xmm9
        vinsertf128 ymm12, ymm1, xmm13, 1
        vpinsrd   xmm1, xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+r9], 1
        vmovd     xmm13, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+r15]
        vpinsrd   xmm15, xmm13, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+r11], 1
        vmovups   ymm13, YMMWORD PTR [64+r13]
        vpunpcklqdq xmm5, xmm11, xmm1
        vpinsrd   xmm1, xmm14, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+r9], 1
        mov       eax, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+rcx]
        vinsertf128 ymm11, ymm5, xmm10, 1
        vpunpcklqdq xmm5, xmm15, xmm1
        vmovups   ymm1, YMMWORD PTR [32+r13]

_B1_15::

        vmovd     xmm14, eax
        lea       rax, QWORD PTR [__ImageBase]
        vpinsrd   xmm15, xmm14, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+rdx], 1
        vpunpcklqdq xmm9, xmm6, xmm15
        vinsertf128 ymm10, ymm5, xmm9, 1
        vmovd     xmm6, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+r15]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+r10]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+r8]
        vmovd     xmm9, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+rcx]
        vpinsrd   xmm8, xmm6, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+r11], 1
        vpinsrd   xmm7, xmm5, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+r9], 1
        vpinsrd   xmm6, xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+rdi], 1
        vpinsrd   xmm5, xmm9, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+rdx], 1
        vpunpcklqdq xmm14, xmm8, xmm7
        vmulps    ymm7, ymm4, ymm12
        vpunpcklqdq xmm8, xmm6, xmm5
        vinsertf128 ymm8, ymm14, xmm8, 1
        vmulps    ymm15, ymm4, ymm8
        vaddps    ymm5, ymm11, ymm15
        vaddps    ymm9, ymm7, ymm5
        vsubps    ymm6, ymm11, ymm5
        vsubps    ymm14, ymm5, ymm9
        vaddps    ymm15, ymm15, ymm6
        vmulps    ymm5, ymm2, YMMWORD PTR [__svml_scos_ha_data_internal+4352]
        vaddps    ymm7, ymm7, ymm14
        vaddps    ymm6, ymm15, ymm7
        vaddps    ymm7, ymm5, YMMWORD PTR [__svml_scos_ha_data_internal+4288]
        vmulps    ymm14, ymm2, ymm7
        vaddps    ymm7, ymm12, ymm8
        vmulps    ymm12, ymm2, YMMWORD PTR [__svml_scos_ha_data_internal+4480]
        vmulps    ymm5, ymm4, ymm14
        vmulps    ymm4, ymm4, ymm11
        vaddps    ymm12, ymm12, YMMWORD PTR [__svml_scos_ha_data_internal+4416]
        vsubps    ymm4, ymm7, ymm4
        vmulps    ymm2, ymm2, ymm12
        vmulps    ymm3, ymm3, ymm4
        vmulps    ymm5, ymm5, ymm4
        vmulps    ymm11, ymm11, ymm2
        vaddps    ymm3, ymm10, ymm3
        vaddps    ymm2, ymm3, ymm11
        vaddps    ymm3, ymm6, ymm5
        vaddps    ymm6, ymm2, ymm3
        vaddps    ymm7, ymm9, ymm6
        vblendvps ymm13, ymm13, ymm7, ymm1
        jmp       _B1_2
        ALIGN     16

_B1_13::

__svml_cosf8_ha_e9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf8_ha_e9_B1_B15:
	DD	1798913
	DD	5690483
	DD	2451563
	DD	2324578
	DD	2197593
	DD	2594896
	DD	2730055
	DD	2078782
	DD	1951797
	DD	1824812
	DD	1697827
	DD	1570842
	DD	5767439
	DD	4027011080
	DD	28677

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B1_1
	DD	imagerel _B1_13
	DD	imagerel _unwind___svml_cosf8_ha_e9_B1_B15

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST1:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_cosf4_ha_ex

__svml_cosf4_ha_ex	PROC

_B2_1::

        DB        243
        DB        15
        DB        30
        DB        250
L52::

        sub       rsp, 504
        lea       r9, QWORD PTR [__ImageBase]
        movups    XMMWORD PTR [400+rsp], xmm15
        xor       r10d, r10d
        movups    XMMWORD PTR [384+rsp], xmm14
        movups    XMMWORD PTR [320+rsp], xmm13
        movups    XMMWORD PTR [336+rsp], xmm12
        movups    XMMWORD PTR [432+rsp], xmm11
        movups    XMMWORD PTR [416+rsp], xmm10
        movups    XMMWORD PTR [352+rsp], xmm9
        movups    XMMWORD PTR [448+rsp], xmm8
        movups    XMMWORD PTR [464+rsp], xmm7
        movups    XMMWORD PTR [368+rsp], xmm6
        mov       QWORD PTR [480+rsp], r13
        lea       r13, QWORD PTR [239+rsp]
        movups    xmm5, XMMWORD PTR [__svml_scos_ha_data_internal+4096]
        and       r13, -64
        movups    xmm1, XMMWORD PTR [__svml_scos_ha_data_internal+5504]
        andps     xmm5, xmm0
        movups    xmm2, XMMWORD PTR [__svml_scos_ha_data_internal+5440]
        movaps    xmm7, xmm5
        movups    xmm9, XMMWORD PTR [__svml_scos_ha_data_internal+4992]
        movaps    xmm4, xmm5
        movaps    xmm8, xmm9
        addps     xmm1, xmm5
        cmpnleps  xmm4, XMMWORD PTR [__svml_scos_ha_data_internal+4160]
        mulps     xmm1, XMMWORD PTR [__svml_scos_ha_data_internal+5376]
        movmskps  eax, xmm4
        movhlps   xmm7, xmm5
        addps     xmm1, xmm2
        movaps    xmm3, xmm1
        subps     xmm1, xmm2
        cvtps2pd  xmm2, xmm5
        subps     xmm1, XMMWORD PTR [__svml_scos_ha_data_internal+5568]
        cvtps2pd  xmm10, xmm1
        movhlps   xmm1, xmm1
        pslld     xmm3, 31
        cvtps2pd  xmm11, xmm1
        mulpd     xmm8, xmm10
        mulpd     xmm9, xmm11
        cvtps2pd  xmm1, xmm7
        subpd     xmm2, xmm8
        subpd     xmm1, xmm9
        movups    xmm6, XMMWORD PTR [__svml_scos_ha_data_internal+5056]
        mulpd     xmm10, xmm6
        mulpd     xmm11, xmm6
        subpd     xmm2, xmm10
        subpd     xmm1, xmm11
        movaps    xmm6, xmm2
        movaps    xmm7, xmm1
        mulpd     xmm6, xmm2
        mulpd     xmm7, xmm1
        movups    xmm12, XMMWORD PTR [__svml_scos_ha_data_internal+5312]
        movaps    xmm15, xmm12
        mulpd     xmm15, xmm6
        mulpd     xmm12, xmm7
        movups    xmm13, XMMWORD PTR [__svml_scos_ha_data_internal+5248]
        addpd     xmm15, xmm13
        addpd     xmm13, xmm12
        mulpd     xmm15, xmm6
        mulpd     xmm13, xmm7
        movups    xmm14, XMMWORD PTR [__svml_scos_ha_data_internal+5184]
        addpd     xmm15, xmm14
        addpd     xmm14, xmm13
        mulpd     xmm15, xmm6
        mulpd     xmm14, xmm7
        movups    xmm12, XMMWORD PTR [__svml_scos_ha_data_internal+5120]
        addpd     xmm15, xmm12
        addpd     xmm12, xmm14
        mulpd     xmm6, xmm15
        mulpd     xmm7, xmm12
        mulpd     xmm6, xmm2
        mulpd     xmm7, xmm1
        addpd     xmm2, xmm6
        addpd     xmm1, xmm7
        cvtpd2ps  xmm10, xmm2
        cvtpd2ps  xmm1, xmm1
        movlhps   xmm10, xmm1
        mov       QWORD PTR [488+rsp], r13
        pxor      xmm10, xmm3
        test      eax, eax
        jne       _B2_12

_B2_2::

        test      r10d, r10d
        jne       _B2_4

_B2_3::

        movups    xmm6, XMMWORD PTR [368+rsp]
        movaps    xmm0, xmm10
        movups    xmm7, XMMWORD PTR [464+rsp]
        movups    xmm8, XMMWORD PTR [448+rsp]
        movups    xmm9, XMMWORD PTR [352+rsp]
        movups    xmm10, XMMWORD PTR [416+rsp]
        movups    xmm11, XMMWORD PTR [432+rsp]
        movups    xmm12, XMMWORD PTR [336+rsp]
        movups    xmm13, XMMWORD PTR [320+rsp]
        movups    xmm14, XMMWORD PTR [384+rsp]
        movups    xmm15, XMMWORD PTR [400+rsp]
        mov       r13, QWORD PTR [480+rsp]
        add       rsp, 504
        ret

_B2_4::

        movups    XMMWORD PTR [r13], xmm0
        movups    XMMWORD PTR [64+r13], xmm10
        je        _B2_3

_B2_7::

        xor       ecx, ecx
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, ecx
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, r10d

_B2_8::

        mov       ecx, ebx
        mov       eax, 1
        shl       eax, cl
        test      esi, eax
        jne       _B2_11

_B2_9::

        inc       ebx
        cmp       ebx, 4
        jl        _B2_8

_B2_10::

        mov       rbx, QWORD PTR [40+rsp]
        mov       rsi, QWORD PTR [32+rsp]
        movups    xmm10, XMMWORD PTR [64+r13]
        jmp       _B2_3

_B2_11::

        lea       rcx, QWORD PTR [r13+rbx*4]
        lea       rdx, QWORD PTR [64+r13+rbx*4]

        call      __svml_scos_ha_cout_rare_internal
        jmp       _B2_9

_B2_12::

        mov       r11d, 2139095040
        movups    xmm15, XMMWORD PTR [__svml_scos_ha_data_internal+4224]
        andps     xmm5, xmm15
        cmpeqps   xmm5, xmm15
        movd      xmm12, r11d
        mov       r11d, 8388607
        pshufd    xmm11, xmm12, 0
        pand      xmm11, xmm0
        psrld     xmm11, 23
        movdqa    xmm14, xmm11
        pslld     xmm14, 1
        paddd     xmm14, xmm11
        movd      xmm11, r11d
        pslld     xmm14, 2
        mov       r11d, 1195376640
        pshufd    xmm7, xmm14, 2
        pshufd    xmm3, xmm14, 3
        movups    XMMWORD PTR [64+rsp], xmm10
        pshufd    xmm10, xmm14, 1
        movd      edx, xmm7
        movd      eax, xmm3
        movd      r8d, xmm14
        movd      ecx, xmm10
        movd      xmm2, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+r9+rdx]
        movd      xmm9, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+r9+rax]
        movups    XMMWORD PTR [48+rsp], xmm4
        movmskps  r10d, xmm5
        punpckldq xmm2, xmm9
        movd      xmm9, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+r9+r8]
        movd      xmm4, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+r9+rcx]
        movd      xmm15, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+r9+rdx]
        movd      xmm5, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+r9+rax]
        punpckldq xmm9, xmm4
        punpckldq xmm15, xmm5
        movd      xmm12, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+r9+rdx]
        mov       edx, 8388608
        punpcklqdq xmm9, xmm15
        movd      xmm15, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+r9+rax]
        mov       eax, 65535
        movd      xmm8, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+r9+r8]
        movd      xmm6, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+r9+rcx]
        pshufd    xmm14, xmm11, 0
        movd      xmm1, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+r9+rcx]
        pand      xmm14, xmm0
        punpckldq xmm8, xmm6
        mov       ecx, -2147483648
        movd      xmm4, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+r9+r8]
        mov       r8d, 1065353216
        movups    XMMWORD PTR [32+rsp], xmm0
        movd      xmm0, edx
        punpcklqdq xmm8, xmm2
        mov       edx, 679477248
        punpckldq xmm4, xmm1
        punpckldq xmm12, xmm15
        movd      xmm15, eax
        pshufd    xmm0, xmm0, 0
        mov       eax, 262143
        punpcklqdq xmm4, xmm12
        movdqa    xmm12, xmm8
        pshufd    xmm7, xmm15, 0
        paddd     xmm14, xmm0
        psrld     xmm12, 16
        pand      xmm8, xmm7
        movdqu    XMMWORD PTR [80+rsp], xmm12
        movdqa    xmm12, xmm14
        pand      xmm14, xmm7
        movdqa    xmm15, xmm8
        movdqa    xmm10, xmm14
        psrlq     xmm15, 32
        psrlq     xmm10, 32
        movdqa    xmm13, xmm14
        movdqa    xmm6, xmm10
        movdqa    xmm0, xmm9
        pmuludq   xmm13, xmm8
        psrld     xmm0, 16
        pmuludq   xmm6, xmm15
        movdqu    XMMWORD PTR [96+rsp], xmm8
        psllq     xmm6, 32
        movdqu    xmm8, XMMWORD PTR [_2il0floatpacket_28]
        pand      xmm9, xmm7
        pand      xmm13, xmm8
        movdqa    xmm1, xmm0
        por       xmm13, xmm6
        psrlq     xmm1, 32
        movdqu    XMMWORD PTR [160+rsp], xmm13
        movdqa    xmm5, xmm9
        movdqa    xmm6, xmm14
        movdqa    xmm13, xmm10
        movdqu    XMMWORD PTR [112+rsp], xmm0
        psrlq     xmm5, 32
        movdqu    XMMWORD PTR [144+rsp], xmm1
        psrld     xmm12, 16
        pmuludq   xmm6, xmm0
        movdqa    xmm0, xmm10
        pmuludq   xmm13, xmm1
        pmuludq   xmm0, xmm5
        movdqa    xmm1, xmm14
        psllq     xmm0, 32
        pmuludq   xmm1, xmm9
        movdqa    xmm2, xmm4
        pmuludq   xmm9, xmm12
        pand      xmm1, xmm8
        pand      xmm4, xmm7
        movdqa    xmm11, xmm12
        por       xmm1, xmm0
        movdqa    xmm0, xmm12
        psrlq     xmm11, 32
        pmuludq   xmm0, xmm4
        psrlq     xmm4, 32
        pmuludq   xmm4, xmm11
        pmuludq   xmm5, xmm11
        psrld     xmm2, 16
        pand      xmm0, xmm8
        movdqa    xmm3, xmm2
        psllq     xmm4, 32
        movdqu    XMMWORD PTR [128+rsp], xmm15
        psrlq     xmm3, 32
        por       xmm0, xmm4
        movdqa    xmm4, xmm12
        movdqa    xmm15, xmm11
        pand      xmm6, xmm8
        pmuludq   xmm4, xmm2
        psllq     xmm13, 32
        pmuludq   xmm15, xmm3
        pmuludq   xmm2, xmm14
        pmuludq   xmm3, xmm10
        pand      xmm2, xmm8
        psllq     xmm3, 32
        pand      xmm4, xmm8
        psllq     xmm15, 32
        por       xmm2, xmm3
        por       xmm6, xmm13
        movdqa    xmm13, xmm1
        por       xmm4, xmm15
        psrld     xmm2, 16
        pand      xmm13, xmm7
        paddd     xmm4, xmm2
        pand      xmm9, xmm8
        psllq     xmm5, 32
        psrld     xmm0, 16
        paddd     xmm13, xmm4
        movdqa    xmm3, xmm6
        por       xmm9, xmm5
        psrld     xmm1, 16
        paddd     xmm0, xmm13
        pand      xmm3, xmm7
        paddd     xmm9, xmm1
        movdqa    xmm13, xmm0
        movdqu    xmm2, XMMWORD PTR [112+rsp]
        paddd     xmm3, xmm9
        movdqu    xmm9, XMMWORD PTR [144+rsp]
        psrld     xmm13, 16
        pmuludq   xmm2, xmm12
        paddd     xmm13, xmm3
        pmuludq   xmm9, xmm11
        pmuludq   xmm12, XMMWORD PTR [96+rsp]
        pmuludq   xmm11, XMMWORD PTR [128+rsp]
        movdqu    xmm3, XMMWORD PTR [80+rsp]
        pand      xmm2, xmm8
        pmuludq   xmm14, xmm3
        psrlq     xmm3, 32
        pmuludq   xmm10, xmm3
        movdqu    xmm5, XMMWORD PTR [160+rsp]
        psllq     xmm9, 32
        movdqa    xmm15, xmm5
        por       xmm2, xmm9
        psrld     xmm6, 16
        movdqa    xmm1, xmm13
        pand      xmm15, xmm7
        paddd     xmm2, xmm6
        psrld     xmm1, 16
        paddd     xmm15, xmm2
        pand      xmm14, xmm8
        psllq     xmm10, 32
        pand      xmm12, xmm8
        psllq     xmm11, 32
        paddd     xmm1, xmm15
        por       xmm14, xmm10
        por       xmm12, xmm11
        psrld     xmm5, 16
        movdqa    xmm4, xmm1
        pand      xmm14, xmm7
        paddd     xmm12, xmm5
        psrld     xmm4, 16
        paddd     xmm14, xmm12
        pand      xmm1, xmm7
        paddd     xmm4, xmm14
        pslld     xmm13, 16
        pslld     xmm4, 16
        pand      xmm0, xmm7
        movd      xmm8, ecx
        paddd     xmm4, xmm1
        pshufd    xmm5, xmm8, 0
        paddd     xmm13, xmm0
        movups    xmm0, XMMWORD PTR [32+rsp]
        movd      xmm10, r8d
        pshufd    xmm7, xmm10, 0
        pand      xmm5, xmm0
        movdqa    xmm2, xmm4
        pxor      xmm7, xmm5
        psrld     xmm2, 9
        movd      xmm14, r11d
        por       xmm2, xmm7
        mov       r8d, 511
        pshufd    xmm15, xmm14, 0
        movdqa    xmm3, xmm2
        mov       ecx, 872415232
        movd      xmm11, eax
        pshufd    xmm9, xmm11, 0
        movd      xmm12, edx
        movd      xmm6, r8d
        pand      xmm9, xmm13
        pshufd    xmm1, xmm6, 0
        psrld     xmm13, 18
        movd      xmm7, ecx
        pand      xmm1, xmm4
        pshufd    xmm10, xmm12, 0
        pslld     xmm1, 14
        pshufd    xmm14, xmm7, 0
        pxor      xmm10, xmm5
        pxor      xmm5, xmm14
        por       xmm1, xmm13
        por       xmm1, xmm5
        mov       ecx, -4096
        pslld     xmm9, 5
        mov       edx, 1086918656
        por       xmm9, xmm10
        mov       r11d, 1086918619
        mov       eax, -1214941318
        mov       r8d, 2147483647
        addps     xmm3, xmm15
        subps     xmm1, xmm5
        subps     xmm9, xmm10
        movaps    xmm8, xmm3
        movd      xmm5, ecx
        movd      xmm13, r11d
        movd      xmm4, eax
        pshufd    xmm11, xmm13, 0
        subps     xmm8, xmm15
        pshufd    xmm12, xmm4, 0
        subps     xmm2, xmm8
        movaps    xmm15, xmm2
        mov       r11d, 897581056
        pshufd    xmm8, xmm5, 0
        addps     xmm15, xmm1
        andps     xmm8, xmm15
        subps     xmm2, xmm15
        subps     xmm15, xmm8
        addps     xmm1, xmm2
        movd      xmm2, edx
        mov       edx, 255
        pshufd    xmm6, xmm2, 0
        addps     xmm9, xmm1
        movdqa    xmm10, xmm6
        mulps     xmm10, xmm8
        mulps     xmm6, xmm15
        mulps     xmm8, xmm12
        mulps     xmm11, xmm9
        mulps     xmm12, xmm15
        addps     xmm6, xmm8
        addps     xmm11, xmm12
        movd      xmm9, r8d
        movd      xmm15, r11d
        pshufd    xmm8, xmm9, 0
        addps     xmm6, xmm11
        movaps    xmm7, xmm6
        andps     xmm8, xmm0
        pshufd    xmm11, xmm15, 0
        addps     xmm7, xmm10
        movdqa    xmm12, xmm11
        subps     xmm10, xmm7
        cmpltps   xmm12, xmm8
        cmpleps   xmm8, xmm11
        addps     xmm6, xmm10
        movd      xmm10, edx
        andps     xmm8, xmm0
        pshufd    xmm14, xmm10, 0
        andps     xmm7, xmm12
        pand      xmm3, xmm14
        orps      xmm8, xmm7
        pslld     xmm3, 4
        movaps    xmm11, xmm8
        movd      edx, xmm3
        andps     xmm12, xmm6
        pshufd    xmm13, xmm3, 1
        pshufd    xmm1, xmm3, 2
        pshufd    xmm3, xmm3, 3
        movd      ecx, xmm1
        movd      r8d, xmm3
        movd      eax, xmm13
        movd      xmm5, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+r9+rcx]
        movd      xmm4, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+r9+r8]
        mulps     xmm11, xmm8
        movd      xmm7, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+r9+r8]
        movd      xmm10, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+r9+rdx]
        movd      xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+r9+rax]
        movd      xmm14, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+r9+rcx]
        punpckldq xmm5, xmm4
        movups    xmm4, XMMWORD PTR [__svml_scos_ha_data_internal+4352]
        punpckldq xmm10, xmm15
        punpckldq xmm14, xmm7
        movd      xmm7, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+r9+rdx]
        movd      xmm13, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+r9+rax]
        mulps     xmm4, xmm11
        movd      xmm3, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+r9+rax]
        movd      xmm6, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+r9+rax]
        punpcklqdq xmm10, xmm14
        addps     xmm4, XMMWORD PTR [__svml_scos_ha_data_internal+4288]
        punpckldq xmm7, xmm13
        movd      xmm14, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+r9+rdx]
        movd      xmm13, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+r9+rdx]
        movd      xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+r9+rcx]
        movd      xmm9, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+r9+r8]
        punpckldq xmm14, xmm3
        movaps    xmm3, xmm8
        punpckldq xmm13, xmm6
        punpckldq xmm15, xmm9
        punpcklqdq xmm14, xmm5
        movaps    xmm5, xmm8
        punpcklqdq xmm13, xmm15
        mulps     xmm5, xmm13
        mulps     xmm3, xmm10
        addps     xmm10, xmm13
        mulps     xmm4, xmm11
        movd      xmm1, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+r9+r8]
        movd      xmm2, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+r9+rcx]
        punpckldq xmm2, xmm1
        unpcklpd  xmm7, xmm2
        movaps    xmm2, xmm7
        movaps    xmm1, xmm7
        movups    xmm13, XMMWORD PTR [__svml_scos_ha_data_internal+4480]
        addps     xmm2, xmm5
        mulps     xmm4, xmm8
        mulps     xmm13, xmm11
        mulps     xmm8, xmm7
        subps     xmm1, xmm2
        addps     xmm13, XMMWORD PTR [__svml_scos_ha_data_internal+4416]
        subps     xmm10, xmm8
        addps     xmm5, xmm1
        mulps     xmm11, xmm13
        mulps     xmm12, xmm10
        mulps     xmm4, xmm10
        mulps     xmm7, xmm11
        addps     xmm14, xmm12
        movaps    xmm15, xmm2
        addps     xmm14, xmm7
        addps     xmm15, xmm3
        movups    xmm8, XMMWORD PTR [48+rsp]
        subps     xmm2, xmm15
        movaps    xmm10, xmm8
        addps     xmm3, xmm2
        andnps    xmm10, XMMWORD PTR [64+rsp]
        addps     xmm5, xmm3
        addps     xmm5, xmm4
        addps     xmm14, xmm5
        addps     xmm15, xmm14
        andps     xmm15, xmm8
        orps      xmm10, xmm15
        jmp       _B2_2
        ALIGN     16

_B2_13::

__svml_cosf4_ha_ex ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf4_ha_ex_B1_B4:
	DD	1602817
	DD	3986549
	DD	1534061
	DD	1931365
	DD	1869917
	DD	1480788
	DD	1747019
	DD	1816642
	DD	1427513
	DD	1366064
	DD	1632295
	DD	1701915
	DD	4129035

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B2_1
	DD	imagerel _B2_7
	DD	imagerel _unwind___svml_cosf4_ha_ex_B1_B4

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf4_ha_ex_B7_B11:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B2_1
	DD	imagerel _B2_7
	DD	imagerel _unwind___svml_cosf4_ha_ex_B1_B4

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B2_7
	DD	imagerel _B2_12
	DD	imagerel _unwind___svml_cosf4_ha_ex_B7_B11

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf4_ha_ex_B12_B12:
	DD	33
	DD	imagerel _B2_1
	DD	imagerel _B2_7
	DD	imagerel _unwind___svml_cosf4_ha_ex_B1_B4

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B2_12
	DD	imagerel _B2_13
	DD	imagerel _unwind___svml_cosf4_ha_ex_B12_B12

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST2:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_cosf4_ha_l9

__svml_cosf4_ha_l9	PROC

_B3_1::

        DB        243
        DB        15
        DB        30
        DB        250
L97::

        sub       rsp, 376
        lea       r9, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [192+rsp], xmm15
        xor       r10d, r10d
        vmovups   XMMWORD PTR [208+rsp], xmm14
        vmovaps   xmm14, xmm0
        vmovups   XMMWORD PTR [224+rsp], xmm13
        vmovups   XMMWORD PTR [240+rsp], xmm12
        vmovups   XMMWORD PTR [256+rsp], xmm11
        vmovups   XMMWORD PTR [272+rsp], xmm10
        vmovups   XMMWORD PTR [288+rsp], xmm9
        vmovups   XMMWORD PTR [304+rsp], xmm8
        vmovups   XMMWORD PTR [320+rsp], xmm7
        vmovups   XMMWORD PTR [336+rsp], xmm6
        mov       QWORD PTR [352+rsp], r13
        lea       r13, QWORD PTR [111+rsp]
        vandps    xmm6, xmm14, XMMWORD PTR [__svml_scos_ha_data_internal+4096]
        and       r13, -64
        vmovups   xmm2, XMMWORD PTR [__svml_scos_ha_data_internal+5440]
        vcvtps2pd ymm5, xmm6
        vcmpnleps xmm13, xmm6, XMMWORD PTR [__svml_scos_ha_data_internal+4160]
        vaddps    xmm1, xmm6, XMMWORD PTR [__svml_scos_ha_data_internal+5504]
        vmovmskps eax, xmm13
        vfmadd132ps xmm1, xmm2, XMMWORD PTR [__svml_scos_ha_data_internal+5376]
        vpslld    xmm0, xmm1, 31
        vsubps    xmm3, xmm1, xmm2
        vmovupd   ymm1, YMMWORD PTR [__svml_scos_ha_data_internal+5312]
        vsubps    xmm4, xmm3, XMMWORD PTR [__svml_scos_ha_data_internal+5568]
        vcvtps2pd ymm2, xmm4
        vfnmadd231pd ymm5, ymm2, YMMWORD PTR [__svml_scos_ha_data_internal+4992]
        vfnmadd132pd ymm2, ymm5, YMMWORD PTR [__svml_scos_ha_data_internal+5056]
        vmulpd    ymm5, ymm2, ymm2
        vfmadd213pd ymm1, ymm5, YMMWORD PTR [__svml_scos_ha_data_internal+5248]
        vfmadd213pd ymm1, ymm5, YMMWORD PTR [__svml_scos_ha_data_internal+5184]
        vfmadd213pd ymm1, ymm5, YMMWORD PTR [__svml_scos_ha_data_internal+5120]
        vmulpd    ymm3, ymm5, ymm1
        vfmadd213pd ymm3, ymm2, ymm2
        vcvtpd2ps xmm4, ymm3
        mov       QWORD PTR [360+rsp], r13
        vxorps    xmm0, xmm4, xmm0
        test      eax, eax
        jne       _B3_12

_B3_2::

        test      r10d, r10d
        jne       _B3_4

_B3_3::

        vzeroupper
        vmovups   xmm6, XMMWORD PTR [336+rsp]
        vmovups   xmm7, XMMWORD PTR [320+rsp]
        vmovups   xmm8, XMMWORD PTR [304+rsp]
        vmovups   xmm9, XMMWORD PTR [288+rsp]
        vmovups   xmm10, XMMWORD PTR [272+rsp]
        vmovups   xmm11, XMMWORD PTR [256+rsp]
        vmovups   xmm12, XMMWORD PTR [240+rsp]
        vmovups   xmm13, XMMWORD PTR [224+rsp]
        vmovups   xmm14, XMMWORD PTR [208+rsp]
        vmovups   xmm15, XMMWORD PTR [192+rsp]
        mov       r13, QWORD PTR [352+rsp]
        add       rsp, 376
        ret

_B3_4::

        vmovups   XMMWORD PTR [r13], xmm14
        vmovups   XMMWORD PTR [64+r13], xmm0
        je        _B3_3

_B3_7::

        xor       eax, eax
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, eax
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, r10d

_B3_8::

        bt        esi, ebx
        jc        _B3_11

_B3_9::

        inc       ebx
        cmp       ebx, 4
        jl        _B3_8

_B3_10::

        mov       rbx, QWORD PTR [40+rsp]
        mov       rsi, QWORD PTR [32+rsp]
        vmovups   xmm0, XMMWORD PTR [64+r13]
        jmp       _B3_3

_B3_11::

        vzeroupper
        lea       rcx, QWORD PTR [r13+rbx*4]
        lea       rdx, QWORD PTR [64+r13+rbx*4]

        call      __svml_scos_ha_cout_rare_internal
        jmp       _B3_9

_B3_12::

        vpand     xmm12, xmm14, XMMWORD PTR [_2il0floatpacket_29]
        vpsrld    xmm7, xmm12, 23
        vmovups   xmm8, XMMWORD PTR [__svml_scos_ha_data_internal+4224]
        vpslld    xmm9, xmm7, 1
        vandps    xmm10, xmm8, xmm6
        vpaddd    xmm3, xmm9, xmm7
        vcmpeqps  xmm6, xmm10, xmm8
        vpslld    xmm4, xmm3, 2
        vmovd     r8d, xmm4
        vmovmskps r10d, xmm6
        vmovups   XMMWORD PTR [32+rsp], xmm0
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+r9+r8]
        vpextrd   r11d, xmm4, 2
        vpextrd   ecx, xmm4, 1
        vpextrd   edx, xmm4, 3
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+r9+r8]
        vmovd     xmm10, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+r9+r11]
        vmovd     xmm2, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+r9+r11]
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+r9+r11]
        vpinsrd   xmm6, xmm11, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+r9+rcx], 1
        vpinsrd   xmm3, xmm15, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+r9+rcx], 1
        vpinsrd   xmm8, xmm10, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+r9+rdx], 1
        vpinsrd   xmm4, xmm2, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+r9+rdx], 1
        vpinsrd   xmm7, xmm12, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+r9+rdx], 1
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+r9+r8]
        vpinsrd   xmm9, xmm5, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+r9+rcx], 1
        vpand     xmm0, xmm14, XMMWORD PTR [_2il0floatpacket_30]
        vmovdqu   xmm12, XMMWORD PTR [_2il0floatpacket_32]
        vpunpcklqdq xmm10, xmm6, xmm8
        vpunpcklqdq xmm11, xmm3, xmm4
        vpaddd    xmm6, xmm0, XMMWORD PTR [_2il0floatpacket_31]
        vpsrld    xmm0, xmm11, 16
        vpand     xmm11, xmm11, xmm12
        vpunpcklqdq xmm1, xmm9, xmm7
        vpsrld    xmm9, xmm6, 16
        vpand     xmm6, xmm6, xmm12
        vpand     xmm2, xmm1, xmm12
        vpmulld   xmm5, xmm9, xmm11
        vpsrld    xmm4, xmm1, 16
        vpmulld   xmm11, xmm9, xmm0
        vpsrld    xmm15, xmm5, 16
        vpmulld   xmm0, xmm6, xmm0
        vpand     xmm7, xmm10, xmm12
        vpmulld   xmm1, xmm6, xmm2
        vpsrld    xmm0, xmm0, 16
        vpand     xmm5, xmm1, xmm12
        vpaddd    xmm11, xmm11, xmm0
        vpmulld   xmm3, xmm6, xmm4
        vpaddd    xmm5, xmm5, xmm11
        vpmulld   xmm2, xmm9, xmm2
        vpsrld    xmm1, xmm1, 16
        vpaddd    xmm11, xmm15, xmm5
        vpand     xmm5, xmm3, xmm12
        vpaddd    xmm2, xmm2, xmm1
        vpsrld    xmm15, xmm11, 16
        vpaddd    xmm5, xmm5, xmm2
        vpsrld    xmm3, xmm3, 16
        vpmulld   xmm8, xmm6, xmm7
        vpaddd    xmm5, xmm15, xmm5
        vpmulld   xmm15, xmm9, xmm4
        vpand     xmm0, xmm8, xmm12
        vpaddd    xmm4, xmm15, xmm3
        vpsrld    xmm10, xmm10, 16
        vpmulld   xmm10, xmm6, xmm10
        vpsrld    xmm1, xmm5, 16
        vpmulld   xmm9, xmm9, xmm7
        vpaddd    xmm15, xmm0, xmm4
        vpsrld    xmm8, xmm8, 16
        vpaddd    xmm2, xmm1, xmm15
        vpand     xmm6, xmm10, xmm12
        vpaddd    xmm7, xmm9, xmm8
        vpsrld    xmm15, xmm2, 16
        vpaddd    xmm10, xmm6, xmm7
        vpaddd    xmm6, xmm15, xmm10
        vpand     xmm9, xmm2, xmm12
        vpslld    xmm8, xmm6, 16
        vpand     xmm12, xmm11, xmm12
        vpand     xmm1, xmm14, XMMWORD PTR [_2il0floatpacket_33]
        vpaddd    xmm0, xmm8, xmm9
        vpxor     xmm10, xmm1, XMMWORD PTR [_2il0floatpacket_34]
        vpsrld    xmm11, xmm0, 9
        vmovups   xmm6, XMMWORD PTR [_2il0floatpacket_35]
        vpor      xmm8, xmm11, xmm10
        vpslld    xmm5, xmm5, 16
        vaddps    xmm2, xmm8, xmm6
        vpaddd    xmm4, xmm5, xmm12
        vsubps    xmm5, xmm2, xmm6
        vpand     xmm0, xmm0, XMMWORD PTR [_2il0floatpacket_39]
        vsubps    xmm3, xmm8, xmm5
        vpxor     xmm15, xmm1, XMMWORD PTR [_2il0floatpacket_36]
        vpand     xmm12, xmm4, XMMWORD PTR [_2il0floatpacket_37]
        vpsrld    xmm4, xmm4, 18
        vpxor     xmm6, xmm1, XMMWORD PTR [_2il0floatpacket_38]
        vpslld    xmm1, xmm0, 14
        vpor      xmm11, xmm1, xmm4
        vpslld    xmm9, xmm12, 5
        vpor      xmm10, xmm11, xmm6
        vpor      xmm7, xmm9, xmm15
        vmovups   xmm12, XMMWORD PTR [_2il0floatpacket_43]
        vsubps    xmm8, xmm10, xmm6
        vsubps    xmm15, xmm7, xmm15
        vaddps    xmm5, xmm3, xmm8
        vmovups   xmm6, XMMWORD PTR [_2il0floatpacket_40]
        vsubps    xmm3, xmm3, xmm5
        vmulps    xmm7, xmm6, xmm5
        vaddps    xmm11, xmm8, xmm3
        vmovaps   xmm10, xmm6
        vaddps    xmm4, xmm15, xmm11
        vfmsub213ps xmm10, xmm5, xmm7
        vandps    xmm8, xmm14, XMMWORD PTR [_2il0floatpacket_42]
        vfmadd132ps xmm5, xmm10, XMMWORD PTR [_2il0floatpacket_41]
        vpand     xmm2, xmm2, XMMWORD PTR [_2il0floatpacket_44]
        vpslld    xmm11, xmm2, 4
        vmovd     edx, xmm11
        vcmpgtps  xmm1, xmm8, xmm12
        vcmpleps  xmm9, xmm8, xmm12
        vfmadd213ps xmm4, xmm6, xmm5
        vmovd     xmm8, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+r9+rdx]
        vandps    xmm15, xmm9, xmm14
        vpextrd   ecx, xmm11, 2
        vandps    xmm0, xmm1, xmm7
        vpextrd   eax, xmm11, 1
        vorps     xmm10, xmm15, xmm0
        vpextrd   r8d, xmm11, 3
        vandps    xmm6, xmm1, xmm4
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+r9+rcx]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+r9+rcx]
        vpinsrd   xmm12, xmm8, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+r9+rax], 1
        vpinsrd   xmm7, xmm5, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+r9+r8], 1
        vpinsrd   xmm2, xmm0, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+r9+r8], 1
        vmulps    xmm9, xmm10, xmm10
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+r9+rdx]
        vunpcklpd xmm7, xmm12, xmm7
        vpinsrd   xmm1, xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+r9+rax], 1
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+r9+rdx]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+r9+rcx]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+r9+rcx]
        vmovd     xmm3, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+r9+rdx]
        vpinsrd   xmm0, xmm12, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+r9+rax], 1
        vpinsrd   xmm11, xmm3, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+r9+rax], 1
        vpinsrd   xmm5, xmm4, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+r9+r8], 1
        vunpcklpd xmm8, xmm1, xmm2
        vmovaps   xmm2, xmm10
        vpinsrd   xmm1, xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+r9+r8], 1
        vpunpcklqdq xmm5, xmm11, xmm5
        vmovapd   xmm11, xmm7
        vunpcklpd xmm15, xmm0, xmm1
        vfmadd213ps xmm2, xmm15, xmm8
        vmovups   xmm0, XMMWORD PTR [__svml_scos_ha_data_internal+4352]
        vfmadd213ps xmm0, xmm9, XMMWORD PTR [__svml_scos_ha_data_internal+4288]
        vfmadd213ps xmm11, xmm10, xmm2
        vsubps    xmm3, xmm8, xmm2
        vmulps    xmm4, xmm9, xmm0
        vfmadd231ps xmm3, xmm15, xmm10
        vsubps    xmm12, xmm2, xmm11
        vaddps    xmm15, xmm7, xmm15
        vmulps    xmm1, xmm10, xmm4
        vfmadd231ps xmm12, xmm10, xmm7
        vfnmadd213ps xmm10, xmm8, xmm15
        vmovups   xmm7, XMMWORD PTR [__svml_scos_ha_data_internal+4480]
        vmovups   xmm0, XMMWORD PTR [32+rsp]
        vfmadd213ps xmm7, xmm9, XMMWORD PTR [__svml_scos_ha_data_internal+4416]
        vaddps    xmm12, xmm3, xmm12
        vfmadd213ps xmm6, xmm10, xmm5
        vmulps    xmm9, xmm9, xmm7
        vfmadd213ps xmm1, xmm10, xmm12
        vfmadd213ps xmm9, xmm8, xmm6
        vaddps    xmm6, xmm9, xmm1
        vaddps    xmm10, xmm11, xmm6
        vblendvps xmm0, xmm0, xmm10, xmm13
        jmp       _B3_2
        ALIGN     16

_B3_13::

__svml_cosf4_ha_l9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf4_ha_l9_B1_B4:
	DD	1604353
	DD	2937979
	DD	1402995
	DD	1341546
	DD	1280097
	DD	1218648
	DD	1157199
	DD	1095750
	DD	1034301
	DD	972852
	DD	911399
	DD	849947
	DD	3080459

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B3_1
	DD	imagerel _B3_7
	DD	imagerel _unwind___svml_cosf4_ha_l9_B1_B4

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf4_ha_l9_B7_B11:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B3_1
	DD	imagerel _B3_7
	DD	imagerel _unwind___svml_cosf4_ha_l9_B1_B4

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B3_7
	DD	imagerel _B3_12
	DD	imagerel _unwind___svml_cosf4_ha_l9_B7_B11

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf4_ha_l9_B12_B12:
	DD	33
	DD	imagerel _B3_1
	DD	imagerel _B3_7
	DD	imagerel _unwind___svml_cosf4_ha_l9_B1_B4

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B3_12
	DD	imagerel _B3_13
	DD	imagerel _unwind___svml_cosf4_ha_l9_B12_B12

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST3:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_cosf4_ha_e9

__svml_cosf4_ha_e9	PROC

_B4_1::

        DB        243
        DB        15
        DB        30
        DB        250
L126::

        sub       rsp, 376
        lea       r9, QWORD PTR [__ImageBase]
        vmovups   XMMWORD PTR [272+rsp], xmm15
        xor       r10d, r10d
        vmovups   XMMWORD PTR [336+rsp], xmm14
        vmovaps   xmm14, xmm0
        vmovups   XMMWORD PTR [192+rsp], xmm13
        vmovups   XMMWORD PTR [208+rsp], xmm12
        vmovups   XMMWORD PTR [256+rsp], xmm11
        vmovups   XMMWORD PTR [320+rsp], xmm10
        vmovups   XMMWORD PTR [240+rsp], xmm9
        vmovups   XMMWORD PTR [304+rsp], xmm8
        vmovups   XMMWORD PTR [288+rsp], xmm7
        vmovups   XMMWORD PTR [224+rsp], xmm6
        mov       QWORD PTR [352+rsp], r13
        lea       r13, QWORD PTR [111+rsp]
        vandps    xmm1, xmm14, XMMWORD PTR [__svml_scos_ha_data_internal+4096]
        and       r13, -64
        vmovups   xmm5, XMMWORD PTR [__svml_scos_ha_data_internal+5440]
        vcmpnleps xmm13, xmm1, XMMWORD PTR [__svml_scos_ha_data_internal+4160]
        vaddps    xmm2, xmm1, XMMWORD PTR [__svml_scos_ha_data_internal+5504]
        vmovmskps eax, xmm13
        vmulps    xmm3, xmm2, XMMWORD PTR [__svml_scos_ha_data_internal+5376]
        mov       QWORD PTR [360+rsp], r13
        vaddps    xmm4, xmm5, xmm3
        vpslld    xmm0, xmm4, 31
        vsubps    xmm2, xmm4, xmm5
        vcvtps2pd ymm4, xmm1
        vsubps    xmm3, xmm2, XMMWORD PTR [__svml_scos_ha_data_internal+5568]
        vcvtps2pd ymm6, xmm3
        vmulpd    ymm5, ymm6, YMMWORD PTR [__svml_scos_ha_data_internal+4992]
        vmulpd    ymm8, ymm6, YMMWORD PTR [__svml_scos_ha_data_internal+5056]
        vsubpd    ymm7, ymm4, ymm5
        vsubpd    ymm3, ymm7, ymm8
        vmulpd    ymm2, ymm3, ymm3
        vmulpd    ymm9, ymm2, YMMWORD PTR [__svml_scos_ha_data_internal+5312]
        vaddpd    ymm10, ymm9, YMMWORD PTR [__svml_scos_ha_data_internal+5248]
        vmulpd    ymm11, ymm2, ymm10
        vaddpd    ymm12, ymm11, YMMWORD PTR [__svml_scos_ha_data_internal+5184]
        vmulpd    ymm15, ymm2, ymm12
        vaddpd    ymm9, ymm15, YMMWORD PTR [__svml_scos_ha_data_internal+5120]
        vmulpd    ymm10, ymm2, ymm9
        vmulpd    ymm4, ymm3, ymm10
        vaddpd    ymm5, ymm3, ymm4
        vcvtpd2ps xmm6, ymm5
        vxorps    xmm0, xmm6, xmm0
        test      eax, eax
        jne       _B4_12

_B4_2::

        test      r10d, r10d
        jne       _B4_4

_B4_3::

        vzeroupper
        vmovups   xmm6, XMMWORD PTR [224+rsp]
        vmovups   xmm7, XMMWORD PTR [288+rsp]
        vmovups   xmm8, XMMWORD PTR [304+rsp]
        vmovups   xmm9, XMMWORD PTR [240+rsp]
        vmovups   xmm10, XMMWORD PTR [320+rsp]
        vmovups   xmm11, XMMWORD PTR [256+rsp]
        vmovups   xmm12, XMMWORD PTR [208+rsp]
        vmovups   xmm13, XMMWORD PTR [192+rsp]
        vmovups   xmm14, XMMWORD PTR [336+rsp]
        vmovups   xmm15, XMMWORD PTR [272+rsp]
        mov       r13, QWORD PTR [352+rsp]
        add       rsp, 376
        ret

_B4_4::

        vmovups   XMMWORD PTR [r13], xmm14
        vmovups   XMMWORD PTR [64+r13], xmm0
        je        _B4_3

_B4_7::

        xor       eax, eax
        mov       QWORD PTR [40+rsp], rbx
        mov       ebx, eax
        mov       QWORD PTR [32+rsp], rsi
        mov       esi, r10d

_B4_8::

        bt        esi, ebx
        jc        _B4_11

_B4_9::

        inc       ebx
        cmp       ebx, 4
        jl        _B4_8

_B4_10::

        mov       rbx, QWORD PTR [40+rsp]
        mov       rsi, QWORD PTR [32+rsp]
        vmovups   xmm0, XMMWORD PTR [64+r13]
        jmp       _B4_3

_B4_11::

        vzeroupper
        lea       rcx, QWORD PTR [r13+rbx*4]
        lea       rdx, QWORD PTR [64+r13+rbx*4]

        call      __svml_scos_ha_cout_rare_internal
        jmp       _B4_9

_B4_12::

        mov       r11d, 2139095040
        vmovups   xmm7, XMMWORD PTR [__svml_scos_ha_data_internal+4224]
        vandps    xmm12, xmm7, xmm1
        vcmpeqps  xmm6, xmm12, xmm7
        vmovd     xmm10, r11d
        mov       r11d, 8388607
        vpshufd   xmm9, xmm10, 0
        vpand     xmm4, xmm9, xmm14
        vpsrld    xmm12, xmm4, 23
        vpslld    xmm5, xmm12, 1
        vpaddd    xmm15, xmm5, xmm12
        vpslld    xmm7, xmm15, 2
        vmovd     xmm15, r11d
        vmovd     r8d, xmm7
        mov       r11d, 679477248
        vmovmskps r10d, xmm6
        vmovups   XMMWORD PTR [32+rsp], xmm0
        vmovd     xmm8, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+r9+r8]
        vpextrd   edx, xmm7, 2
        vpextrd   ecx, xmm7, 1
        vpextrd   eax, xmm7, 3
        vmovd     xmm9, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+r9+r8]
        vmovd     xmm6, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+r9+rdx]
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+r9+rdx]
        vmovd     xmm2, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+r9+rdx]
        mov       edx, 8388608
        vpinsrd   xmm3, xmm8, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+r9+rcx], 1
        vpinsrd   xmm0, xmm9, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+r9+rcx], 1
        vpinsrd   xmm10, xmm6, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+r9+rax], 1
        vpinsrd   xmm4, xmm11, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+r9+rax], 1
        vmovd     xmm6, edx
        vpinsrd   xmm12, xmm2, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+r9+rax], 1
        vmovd     xmm1, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+r9+r8]
        vpinsrd   xmm5, xmm1, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+r9+rcx], 1
        vpshufd   xmm7, xmm15, 0
        vpshufd   xmm9, xmm6, 0
        vpunpcklqdq xmm10, xmm3, xmm10
        vpand     xmm3, xmm7, xmm14
        vpunpcklqdq xmm8, xmm0, xmm4
        vpaddd    xmm1, xmm3, xmm9
        vpsrld    xmm9, xmm1, 16
        vpsrld    xmm4, xmm8, 16
        mov       eax, 65535
        mov       ecx, -2147483648
        vpunpcklqdq xmm11, xmm5, xmm12
        mov       r8d, 1065353216
        mov       edx, 262143
        vmovd     xmm0, eax
        mov       eax, 872415232
        vpshufd   xmm12, xmm0, 0
        vpsrld    xmm0, xmm11, 16
        vpand     xmm6, xmm1, xmm12
        vpand     xmm11, xmm11, xmm12
        vpmulld   xmm5, xmm9, xmm11
        vpand     xmm2, xmm8, xmm12
        vpmulld   xmm11, xmm9, xmm0
        vpsrld    xmm15, xmm5, 16
        vpmulld   xmm0, xmm6, xmm0
        vpand     xmm7, xmm10, xmm12
        vpmulld   xmm1, xmm6, xmm2
        vpsrld    xmm0, xmm0, 16
        vpand     xmm5, xmm1, xmm12
        vpaddd    xmm11, xmm11, xmm0
        vpmulld   xmm3, xmm6, xmm4
        vpaddd    xmm5, xmm5, xmm11
        vpmulld   xmm2, xmm9, xmm2
        vpsrld    xmm0, xmm1, 16
        vpaddd    xmm11, xmm15, xmm5
        vpand     xmm5, xmm3, xmm12
        vpaddd    xmm1, xmm2, xmm0
        vpsrld    xmm15, xmm11, 16
        vpaddd    xmm5, xmm5, xmm1
        vpsrld    xmm10, xmm10, 16
        vpmulld   xmm8, xmm6, xmm7
        vpaddd    xmm5, xmm15, xmm5
        vpmulld   xmm4, xmm9, xmm4
        vpsrld    xmm15, xmm3, 16
        vpand     xmm1, xmm8, xmm12
        vpaddd    xmm3, xmm4, xmm15
        vpmulld   xmm15, xmm6, xmm10
        vpsrld    xmm2, xmm5, 16
        vpmulld   xmm7, xmm9, xmm7
        vpaddd    xmm0, xmm1, xmm3
        vpsrld    xmm8, xmm8, 16
        vpaddd    xmm0, xmm2, xmm0
        vpand     xmm6, xmm15, xmm12
        vpaddd    xmm15, xmm7, xmm8
        vpsrld    xmm3, xmm0, 16
        vpaddd    xmm7, xmm6, xmm15
        vpaddd    xmm8, xmm3, xmm7
        vmovd     xmm9, ecx
        vpslld    xmm3, xmm8, 16
        vpand     xmm10, xmm0, xmm12
        vpand     xmm12, xmm11, xmm12
        vmovd     xmm0, r8d
        vpshufd   xmm11, xmm9, 0
        vpaddd    xmm15, xmm3, xmm10
        vpshufd   xmm4, xmm0, 0
        vpslld    xmm5, xmm5, 16
        vpand     xmm2, xmm11, xmm14
        vpaddd    xmm5, xmm5, xmm12
        vpsrld    xmm1, xmm15, 9
        vpxor     xmm12, xmm2, xmm4
        vmovups   xmm7, XMMWORD PTR [_2il0floatpacket_35]
        vpor      xmm8, xmm1, xmm12
        mov       ecx, 511
        vmovd     xmm9, edx
        vpshufd   xmm11, xmm9, 0
        vmovd     xmm3, r11d
        vpshufd   xmm10, xmm3, 0
        vpand     xmm4, xmm11, xmm5
        vpslld    xmm12, xmm4, 5
        vpsrld    xmm5, xmm5, 18
        mov       r8d, 255
        vaddps    xmm0, xmm8, xmm7
        vsubps    xmm6, xmm0, xmm7
        vsubps    xmm1, xmm8, xmm6
        vmovd     xmm6, eax
        vpshufd   xmm3, xmm6, 0
        vpxor     xmm8, xmm2, xmm10
        vpxor     xmm3, xmm2, xmm3
        vmovd     xmm2, ecx
        vpor      xmm7, xmm12, xmm8
        vpshufd   xmm12, xmm2, 0
        vsubps    xmm4, xmm7, xmm8
        vpand     xmm15, xmm12, xmm15
        vpslld    xmm7, xmm15, 14
        vpor      xmm8, xmm7, xmm5
        vpor      xmm6, xmm8, xmm3
        vmovups   xmm12, XMMWORD PTR [_2il0floatpacket_46]
        vsubps    xmm10, xmm6, xmm3
        vaddps    xmm2, xmm1, xmm10
        vsubps    xmm9, xmm1, xmm2
        vmovups   xmm1, XMMWORD PTR [_2il0floatpacket_45]
        vaddps    xmm11, xmm10, xmm9
        vaddps    xmm5, xmm4, xmm11
        vandps    xmm4, xmm2, XMMWORD PTR [_2il0floatpacket_47]
        vmulps    xmm6, xmm12, xmm4
        vsubps    xmm7, xmm2, xmm4
        vmulps    xmm15, xmm1, xmm4
        vmulps    xmm3, xmm5, XMMWORD PTR [_2il0floatpacket_40]
        vmulps    xmm8, xmm1, xmm7
        vmulps    xmm10, xmm12, xmm7
        vaddps    xmm9, xmm8, xmm6
        vaddps    xmm11, xmm3, xmm10
        vmovups   xmm4, XMMWORD PTR [_2il0floatpacket_43]
        vaddps    xmm1, xmm9, xmm11
        vandps    xmm2, xmm14, XMMWORD PTR [_2il0floatpacket_42]
        vmovd     xmm9, r8d
        vcmpleps  xmm5, xmm2, xmm4
        vcmpgtps  xmm8, xmm2, xmm4
        vaddps    xmm12, xmm15, xmm1
        vpshufd   xmm11, xmm9, 0
        vandps    xmm7, xmm8, xmm12
        vpand     xmm0, xmm0, xmm11
        vsubps    xmm15, xmm15, xmm12
        vaddps    xmm6, xmm1, xmm15
        vandps    xmm15, xmm5, xmm14
        vpslld    xmm5, xmm0, 4
        vorps     xmm3, xmm15, xmm7
        vmovd     edx, xmm5
        vandps    xmm6, xmm8, xmm6
        vmulps    xmm10, xmm3, xmm3
        vpextrd   r11d, xmm5, 2
        vpextrd   eax, xmm5, 1
        vpextrd   ecx, xmm5, 3
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+r9+rdx]
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+r9+rdx]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+r9+r11]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+r9+r11]
        vpinsrd   xmm7, xmm12, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+r9+rax], 1
        vpinsrd   xmm1, xmm11, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+r9+rax], 1
        vpinsrd   xmm8, xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+r9+rcx], 1
        vpinsrd   xmm2, xmm0, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+r9+rcx], 1
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+r9+rdx]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+r9+r11]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+r9+r11]
        vmovd     xmm4, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+r9+rdx]
        vpinsrd   xmm12, xmm4, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+r9+rax], 1
        vpinsrd   xmm15, xmm5, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+r9+rcx], 1
        vpunpcklqdq xmm9, xmm7, xmm8
        vunpcklpd xmm7, xmm1, xmm2
        vpinsrd   xmm2, xmm0, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+r9+rcx], 1
        vpinsrd   xmm1, xmm11, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+r9+rax], 1
        vmulps    xmm0, xmm3, xmm9
        vpunpcklqdq xmm8, xmm12, xmm15
        vpunpcklqdq xmm11, xmm1, xmm2
        vmulps    xmm4, xmm3, xmm11
        vaddps    xmm15, xmm7, xmm4
        vaddps    xmm5, xmm0, xmm15
        vsubps    xmm12, xmm7, xmm15
        vsubps    xmm1, xmm15, xmm5
        vmulps    xmm15, xmm10, XMMWORD PTR [__svml_scos_ha_data_internal+4352]
        vaddps    xmm2, xmm4, xmm12
        vaddps    xmm4, xmm0, xmm1
        vaddps    xmm0, xmm15, XMMWORD PTR [__svml_scos_ha_data_internal+4288]
        vaddps    xmm12, xmm2, xmm4
        vmulps    xmm1, xmm10, xmm0
        vaddps    xmm0, xmm9, xmm11
        vmulps    xmm9, xmm10, XMMWORD PTR [__svml_scos_ha_data_internal+4480]
        vmulps    xmm15, xmm3, xmm1
        vmulps    xmm3, xmm3, xmm7
        vaddps    xmm9, xmm9, XMMWORD PTR [__svml_scos_ha_data_internal+4416]
        vmulps    xmm10, xmm10, xmm9
        vsubps    xmm0, xmm0, xmm3
        vmulps    xmm6, xmm6, xmm0
        vmulps    xmm7, xmm7, xmm10
        vmulps    xmm15, xmm15, xmm0
        vaddps    xmm6, xmm8, xmm6
        vaddps    xmm2, xmm12, xmm15
        vaddps    xmm1, xmm6, xmm7
        vmovups   xmm0, XMMWORD PTR [32+rsp]
        vaddps    xmm3, xmm1, xmm2
        vaddps    xmm4, xmm5, xmm3
        vblendvps xmm0, xmm0, xmm4, xmm13
        jmp       _B4_2
        ALIGN     16

_B4_13::

__svml_cosf4_ha_e9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf4_ha_e9_B1_B4:
	DD	1604353
	DD	2937979
	DD	944243
	DD	1210474
	DD	1280097
	DD	1022040
	DD	1353807
	DD	1095750
	DD	903229
	DD	841780
	DD	1435687
	DD	1177627
	DD	3080459

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B4_1
	DD	imagerel _B4_7
	DD	imagerel _unwind___svml_cosf4_ha_e9_B1_B4

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf4_ha_e9_B7_B11:
	DD	265761
	DD	287758
	DD	340999
	DD	imagerel _B4_1
	DD	imagerel _B4_7
	DD	imagerel _unwind___svml_cosf4_ha_e9_B1_B4

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B4_7
	DD	imagerel _B4_12
	DD	imagerel _unwind___svml_cosf4_ha_e9_B7_B11

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf4_ha_e9_B12_B12:
	DD	33
	DD	imagerel _B4_1
	DD	imagerel _B4_7
	DD	imagerel _unwind___svml_cosf4_ha_e9_B1_B4

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B4_12
	DD	imagerel _B4_13
	DD	imagerel _unwind___svml_cosf4_ha_e9_B12_B12

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST4:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_cosf8_ha_l9

__svml_cosf8_ha_l9	PROC

_B5_1::

        DB        243
        DB        15
        DB        30
        DB        250
L155::

        push      rbx
        push      rdi
        sub       rsp, 536
        xor       edi, edi
        vmovups   YMMWORD PTR [208+rsp], ymm15
        vmovups   YMMWORD PTR [240+rsp], ymm14
        vmovups   YMMWORD PTR [272+rsp], ymm13
        vmovups   YMMWORD PTR [304+rsp], ymm12
        vmovups   YMMWORD PTR [336+rsp], ymm11
        vmovups   YMMWORD PTR [368+rsp], ymm10
        vmovups   YMMWORD PTR [400+rsp], ymm9
        vmovups   YMMWORD PTR [432+rsp], ymm8
        vmovups   YMMWORD PTR [464+rsp], ymm7
        vmovups   YMMWORD PTR [496+rsp], ymm6
        mov       QWORD PTR [40+rsp], r13
        lea       r13, QWORD PTR [111+rsp]
        vmovdqa   ymm14, ymm0
        and       r13, -64
        vmovups   ymm5, YMMWORD PTR [__svml_scos_ha_data_internal+5440]
        vmovupd   ymm6, YMMWORD PTR [__svml_scos_ha_data_internal+4992]
        vmovupd   ymm8, YMMWORD PTR [__svml_scos_ha_data_internal+5056]
        vmovupd   ymm10, YMMWORD PTR [__svml_scos_ha_data_internal+5312]
        vmovupd   ymm11, YMMWORD PTR [__svml_scos_ha_data_internal+5184]
        vmovupd   ymm12, YMMWORD PTR [__svml_scos_ha_data_internal+5120]
        vandps    ymm2, ymm14, YMMWORD PTR [__svml_scos_ha_data_internal+4096]
        vaddps    ymm4, ymm2, YMMWORD PTR [__svml_scos_ha_data_internal+5504]
        vcmpnle_uqps ymm13, ymm2, YMMWORD PTR [__svml_scos_ha_data_internal+4160]
        vfmadd132ps ymm4, ymm5, YMMWORD PTR [__svml_scos_ha_data_internal+5376]
        vsubps    ymm1, ymm4, ymm5
        vpslld    ymm3, ymm4, 31
        vsubps    ymm0, ymm1, YMMWORD PTR [__svml_scos_ha_data_internal+5568]
        vmovmskps eax, ymm13
        mov       QWORD PTR [528+rsp], r13
        test      eax, eax
        vextractf128 xmm4, ymm0, 1
        vextractf128 xmm5, ymm2, 1
        vcvtps2pd ymm1, xmm0
        vcvtps2pd ymm7, xmm2
        vcvtps2pd ymm0, xmm4
        vcvtps2pd ymm9, xmm5
        vfnmadd231pd ymm7, ymm6, ymm1
        vfnmadd231pd ymm9, ymm6, ymm0
        vmovupd   ymm6, YMMWORD PTR [__svml_scos_ha_data_internal+5248]
        vfnmadd213pd ymm1, ymm8, ymm7
        vfnmadd213pd ymm0, ymm8, ymm9
        vmulpd    ymm15, ymm1, ymm1
        vmulpd    ymm5, ymm0, ymm0
        vmovdqa   ymm4, ymm6
        vfmadd231pd ymm4, ymm10, ymm15
        vfmadd231pd ymm6, ymm10, ymm5
        vfmadd213pd ymm4, ymm15, ymm11
        vfmadd213pd ymm6, ymm5, ymm11
        vfmadd213pd ymm4, ymm15, ymm12
        vfmadd213pd ymm6, ymm5, ymm12
        vmulpd    ymm7, ymm15, ymm4
        vmulpd    ymm8, ymm5, ymm6
        vfmadd213pd ymm7, ymm1, ymm1
        vfmadd213pd ymm8, ymm0, ymm0
        vcvtpd2ps xmm0, ymm7
        vcvtpd2ps xmm1, ymm8
        vinsertf128 ymm9, ymm0, xmm1, 1
        vxorps    ymm0, ymm9, ymm3
        jne       _B5_12

_B5_2::

        test      edi, edi
        jne       _B5_4

_B5_3::

        vmovups   ymm6, YMMWORD PTR [496+rsp]
        vmovups   ymm7, YMMWORD PTR [464+rsp]
        vmovups   ymm8, YMMWORD PTR [432+rsp]
        vmovups   ymm9, YMMWORD PTR [400+rsp]
        vmovups   ymm10, YMMWORD PTR [368+rsp]
        vmovups   ymm11, YMMWORD PTR [336+rsp]
        vmovups   ymm12, YMMWORD PTR [304+rsp]
        vmovups   ymm13, YMMWORD PTR [272+rsp]
        vmovups   ymm14, YMMWORD PTR [240+rsp]
        vmovups   ymm15, YMMWORD PTR [208+rsp]
        mov       r13, QWORD PTR [40+rsp]
        add       rsp, 536
        pop       rdi
        pop       rbx
        ret

_B5_4::

        vmovups   YMMWORD PTR [r13], ymm14
        vmovups   YMMWORD PTR [64+r13], ymm0
        je        _B5_3

_B5_7::

        xor       ebx, ebx

_B5_8::

        bt        edi, ebx
        jc        _B5_11

_B5_9::

        inc       ebx
        cmp       ebx, 8
        jl        _B5_8

_B5_10::

        vmovups   ymm0, YMMWORD PTR [64+r13]
        jmp       _B5_3

_B5_11::

        vzeroupper
        lea       rcx, QWORD PTR [r13+rbx*4]
        lea       rdx, QWORD PTR [64+r13+rbx*4]

        call      __svml_scos_ha_cout_rare_internal
        jmp       _B5_9

_B5_12::

        vpand     ymm9, ymm14, YMMWORD PTR [_2il0floatpacket_48]
        vmovups   ymm8, YMMWORD PTR [__svml_scos_ha_data_internal+4224]
        vmovups   YMMWORD PTR [r13], ymm0
        vpsrld    ymm3, ymm9, 23
        vpslld    ymm7, ymm3, 1
        vpaddd    ymm4, ymm7, ymm3
        vpslld    ymm11, ymm4, 2
        vandps    ymm10, ymm8, ymm2
        vcmpeqps  ymm12, ymm10, ymm8
        vmovmskps eax, ymm12
        mov       DWORD PTR [32+rsp], eax
        lea       rax, QWORD PTR [__ImageBase]
        vpextrd   edi, xmm11, 2
        vextracti128 xmm9, ymm11, 1
        vmovd     ecx, xmm11
        vmovd     xmm6, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+rdi]
        vmovd     xmm1, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+rdi]
        vmovd     r9d, xmm9
        vmovd     xmm10, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+rcx]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+rcx]
        vpextrd   r11d, xmm9, 2
        vpextrd   ebx, xmm11, 1
        vpextrd   r8d, xmm11, 3
        vpextrd   r10d, xmm9, 1
        vpextrd   edx, xmm9, 3
        vmovd     xmm7, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+r9]
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+r11]
        vpinsrd   xmm8, xmm10, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+rbx], 1
        vpinsrd   xmm5, xmm6, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+r8], 1
        vpinsrd   xmm2, xmm7, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+r10], 1
        vpinsrd   xmm3, xmm15, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rax+rdx], 1
        vpinsrd   xmm11, xmm0, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+rbx], 1
        vpinsrd   xmm6, xmm1, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+r8], 1
        vpunpcklqdq xmm12, xmm8, xmm5
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+r9]
        vpunpcklqdq xmm4, xmm2, xmm3
        vmovd     xmm2, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+rcx]
        vpinsrd   xmm9, xmm5, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+r10], 1
        vpunpcklqdq xmm8, xmm11, xmm6
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+r9]
        vmovd     xmm3, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+rdi]
        vpinsrd   xmm5, xmm11, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+r10], 1
        vpinsrd   xmm0, xmm3, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+r8], 1
        vinsertf128 ymm10, ymm12, xmm4, 1
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+r11]
        vpinsrd   xmm7, xmm12, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rax+rdx], 1
        vpinsrd   xmm4, xmm2, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+rbx], 1
        vpunpcklqdq xmm15, xmm9, xmm7
        vpand     ymm7, ymm14, YMMWORD PTR [_2il0floatpacket_49]
        vpunpcklqdq xmm1, xmm4, xmm0
        vinsertf128 ymm6, ymm8, xmm15, 1
        vmovd     xmm8, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+r11]
        vpinsrd   xmm12, xmm8, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+rax+rdx], 1
        vpaddd    ymm15, ymm7, YMMWORD PTR [_2il0floatpacket_50]
        vpsrld    ymm4, ymm6, 16
        vpunpcklqdq xmm9, xmm5, xmm12
        vmovdqu   ymm12, YMMWORD PTR [_2il0floatpacket_51]
        vpand     ymm2, ymm6, ymm12
        vpand     ymm6, ymm15, ymm12
        vpand     ymm7, ymm10, ymm12
        vpsrld    ymm10, ymm10, 16
        vpmulld   ymm3, ymm6, ymm4
        vpmulld   ymm8, ymm6, ymm7
        vpmulld   ymm10, ymm6, ymm10
        vinsertf128 ymm11, ymm1, xmm9, 1
        vpsrld    ymm0, ymm11, 16
        vpsrld    ymm9, ymm15, 16
        vpand     ymm11, ymm11, ymm12
        vpmulld   ymm5, ymm9, ymm11
        vpmulld   ymm11, ymm9, ymm0
        vpmulld   ymm0, ymm6, ymm0
        vpsrld    ymm0, ymm0, 16
        vpsrld    ymm15, ymm5, 16
        vpaddd    ymm11, ymm11, ymm0
        vpmulld   ymm1, ymm6, ymm2
        vpand     ymm5, ymm1, ymm12
        vpsrld    ymm0, ymm1, 16
        vpaddd    ymm5, ymm5, ymm11
        vpmulld   ymm2, ymm9, ymm2
        vpaddd    ymm11, ymm15, ymm5
        vpand     ymm5, ymm3, ymm12
        vpaddd    ymm2, ymm2, ymm0
        vpsrld    ymm3, ymm3, 16
        vpsrld    ymm15, ymm11, 16
        vpand     ymm0, ymm8, ymm12
        vpaddd    ymm5, ymm5, ymm2
        vpsrld    ymm8, ymm8, 16
        vpand     ymm11, ymm11, ymm12
        vpaddd    ymm5, ymm15, ymm5
        vpmulld   ymm4, ymm9, ymm4
        vpaddd    ymm15, ymm4, ymm3
        vpsrld    ymm1, ymm5, 16
        vpand     ymm3, ymm10, ymm12
        vpslld    ymm5, ymm5, 16
        vpaddd    ymm2, ymm0, ymm15
        vmovups   ymm10, YMMWORD PTR [_2il0floatpacket_21]
        vpaddd    ymm2, ymm1, ymm2
        vpand     ymm1, ymm14, YMMWORD PTR [_2il0floatpacket_52]
        vpsrld    ymm15, ymm2, 16
        vpand     ymm2, ymm2, ymm12
        vpmulld   ymm6, ymm9, ymm7
        vpaddd    ymm9, ymm6, ymm8
        vpaddd    ymm7, ymm3, ymm9
        vpaddd    ymm15, ymm15, ymm7
        vpxor     ymm7, ymm1, YMMWORD PTR [_2il0floatpacket_54]
        vpslld    ymm4, ymm15, 16
        vpaddd    ymm0, ymm4, ymm2
        vpaddd    ymm4, ymm5, ymm11
        vpxor     ymm11, ymm1, YMMWORD PTR [_2il0floatpacket_53]
        vpsrld    ymm12, ymm0, 9
        vpand     ymm0, ymm0, YMMWORD PTR [_2il0floatpacket_57]
        vpand     ymm5, ymm4, YMMWORD PTR [_2il0floatpacket_55]
        vpor      ymm6, ymm12, ymm11
        vpsrld    ymm11, ymm4, 18
        vpslld    ymm12, ymm5, 5
        vaddps    ymm2, ymm6, ymm10
        vpor      ymm9, ymm12, ymm7
        vsubps    ymm8, ymm2, ymm10
        vpand     ymm2, ymm2, YMMWORD PTR [_2il0floatpacket_59]
        vsubps    ymm3, ymm6, ymm8
        vsubps    ymm15, ymm9, ymm7
        vpxor     ymm8, ymm1, YMMWORD PTR [_2il0floatpacket_56]
        vpslld    ymm1, ymm0, 14
        vpor      ymm10, ymm1, ymm11
        vpor      ymm6, ymm10, ymm8
        vsubps    ymm5, ymm6, ymm8
        vaddps    ymm0, ymm3, ymm5
        vsubps    ymm12, ymm3, ymm0
        vmovups   ymm3, YMMWORD PTR [_2il0floatpacket_27]
        vaddps    ymm9, ymm5, ymm12
        vaddps    ymm5, ymm15, ymm9
        vmovups   ymm15, YMMWORD PTR [_2il0floatpacket_22]
        vmulps    ymm11, ymm15, ymm0
        vmovaps   ymm7, ymm15
        vfmsub213ps ymm7, ymm0, ymm11
        vandps    ymm1, ymm14, YMMWORD PTR [_2il0floatpacket_26]
        vcmpgt_oqps ymm8, ymm1, ymm3
        vcmple_oqps ymm4, ymm1, ymm3
        vfmadd132ps ymm0, ymm7, YMMWORD PTR [_2il0floatpacket_58]
        vandps    ymm6, ymm8, ymm11
        vpslld    ymm11, ymm2, 4
        vfmadd213ps ymm5, ymm15, ymm0
        vandps    ymm10, ymm4, ymm14
        vorps     ymm10, ymm10, ymm6
        vandps    ymm6, ymm8, ymm5
        vmulps    ymm9, ymm10, ymm10
        vextracti128 xmm0, ymm11, 1
        vmovd     r10d, xmm11
        vmovd     ebx, xmm0
        vmovd     xmm8, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+r10]
        vpextrd   r8d, xmm11, 2
        vpextrd   edx, xmm0, 2
        vpextrd   r9d, xmm11, 1
        vpextrd   edi, xmm11, 3
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+r8]
        vpextrd   ecx, xmm0, 1
        vpextrd   r11d, xmm0, 3
        vmovd     xmm1, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+rbx]
        vmovd     xmm2, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+rdx]
        vpinsrd   xmm12, xmm8, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+r9], 1
        vpinsrd   xmm7, xmm5, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+rdi], 1
        vpinsrd   xmm3, xmm1, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+rcx], 1
        vpinsrd   xmm4, xmm2, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+rax+r11], 1
        vmovd     xmm8, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+r10]
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+r8]
        vmovd     xmm2, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+rbx]
        vpinsrd   xmm0, xmm5, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+rdi], 1
        vmovd     xmm5, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+r10]
        vpunpcklqdq xmm15, xmm12, xmm7
        vpinsrd   xmm12, xmm8, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+r9], 1
        vpunpcklqdq xmm11, xmm3, xmm4
        vmovd     xmm3, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+rdx]
        vpinsrd   xmm4, xmm2, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+rcx], 1
        vpunpcklqdq xmm1, xmm12, xmm0
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+r8]
        vpinsrd   xmm0, xmm12, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+rdi], 1
        vinsertf128 ymm7, ymm15, xmm11, 1
        vpinsrd   xmm11, xmm3, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+rax+r11], 1
        vpinsrd   xmm15, xmm5, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+r9], 1
        vmovd     xmm3, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+rbx]
        vpunpcklqdq xmm8, xmm4, xmm11
        vmovd     xmm4, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+rdx]
        vpinsrd   xmm11, xmm3, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+rcx], 1
        vpinsrd   xmm5, xmm4, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+rax+r11], 1
        vpunpcklqdq xmm2, xmm15, xmm0
        vmovd     xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+r10]
        vmovd     xmm0, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+r8]
        vpinsrd   xmm3, xmm0, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+rdi], 1
        vpunpcklqdq xmm12, xmm11, xmm5
        vmovd     xmm11, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+rbx]
        mov       edi, DWORD PTR [32+rsp]
        vinsertf128 ymm5, ymm2, xmm12, 1
        vmovd     xmm12, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+rdx]
        vpinsrd   xmm0, xmm12, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+r11], 1
        vmovaps   ymm2, ymm10
        vinsertf128 ymm8, ymm1, xmm8, 1
        vpinsrd   xmm1, xmm15, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+r9], 1
        vpinsrd   xmm15, xmm11, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rax+rcx], 1
        vpunpcklqdq xmm4, xmm1, xmm3
        vpunpcklqdq xmm1, xmm15, xmm0
        vmovaps   ymm11, ymm7
        vinsertf128 ymm15, ymm4, xmm1, 1
        vfmadd213ps ymm2, ymm15, ymm8
        vmovups   ymm1, YMMWORD PTR [__svml_scos_ha_data_internal+4352]
        vfmadd213ps ymm11, ymm10, ymm2
        vfmadd213ps ymm1, ymm9, YMMWORD PTR [__svml_scos_ha_data_internal+4288]
        vsubps    ymm12, ymm8, ymm2
        vsubps    ymm0, ymm2, ymm11
        vmulps    ymm3, ymm9, ymm1
        vfmadd231ps ymm12, ymm15, ymm10
        vfmadd231ps ymm0, ymm10, ymm7
        vaddps    ymm15, ymm7, ymm15
        vmovups   ymm7, YMMWORD PTR [__svml_scos_ha_data_internal+4480]
        vmulps    ymm4, ymm10, ymm3
        vfnmadd213ps ymm10, ymm8, ymm15
        vaddps    ymm12, ymm12, ymm0
        vfmadd213ps ymm7, ymm9, YMMWORD PTR [__svml_scos_ha_data_internal+4416]
        vfmadd213ps ymm6, ymm10, ymm5
        vfmadd213ps ymm4, ymm10, ymm12
        vmovups   ymm0, YMMWORD PTR [r13]
        vmulps    ymm9, ymm9, ymm7
        vfmadd213ps ymm9, ymm8, ymm6
        vaddps    ymm6, ymm9, ymm4
        vaddps    ymm10, ymm11, ymm6
        vblendvps ymm0, ymm0, ymm10, ymm13
        jmp       _B5_2
        ALIGN     16

_B5_13::

__svml_cosf8_ha_l9 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf8_ha_l9_B1_B12:
	DD	1732097
	DD	382062
	DD	2058345
	DD	1931360
	DD	1804375
	DD	1677390
	DD	1550405
	DD	1423420
	DD	1296435
	DD	1169450
	DD	1042465
	DD	915480
	DD	4391181
	DD	805662726

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B5_1
	DD	imagerel _B5_13
	DD	imagerel _unwind___svml_cosf8_ha_l9_B1_B12

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST5:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_cosf16_ha_z0

__svml_cosf16_ha_z0	PROC

_B6_1::

        DB        243
        DB        15
        DB        30
        DB        250
L182::

        sub       rsp, 1336
        xor       eax, eax
        vmovups   ZMMWORD PTR [1264+rsp], zmm21
        mov       QWORD PTR [1256+rsp], r13
        lea       r13, QWORD PTR [1119+rsp]
        vmovups   zmm26, ZMMWORD PTR [__svml_scos_ha_data_internal+5504]
        and       r13, -64
        vmovups   zmm23, ZMMWORD PTR [__svml_scos_ha_data_internal+5440]
        vmovups   zmm5, ZMMWORD PTR [__svml_scos_ha_data_internal+5376]
        vmovups   zmm4, ZMMWORD PTR [__svml_scos_ha_data_internal+4160]
        vmovups   zmm25, ZMMWORD PTR [__svml_scos_ha_data_internal+5568]
        vmovups   zmm31, ZMMWORD PTR [__svml_scos_ha_data_internal+4992]
        vmovups   zmm21, ZMMWORD PTR [__svml_scos_ha_data_internal+5312]
        vmovaps   zmm27, zmm0
        vandps    zmm3, zmm27, ZMMWORD PTR [__svml_scos_ha_data_internal+4096]
        vaddps    zmm22, zmm3, zmm26 {rn-sae}
        vpternlogd zmm26, zmm26, zmm26, 255
        vcmpps    k1, zmm3, zmm4, 18 {sae}
        vfmadd213ps zmm22, zmm5, zmm23 {rn-sae}
        vsubps    zmm24, zmm22, zmm23 {rn-sae}
        vpslld    zmm2, zmm22, 31
        vmovups   zmm22, ZMMWORD PTR [__svml_scos_ha_data_internal+5184]
        vmovups   zmm23, ZMMWORD PTR [__svml_scos_ha_data_internal+5120]
        vsubps    zmm28, zmm24, zmm25 {rn-sae}
        mov       QWORD PTR [1328+rsp], r13
        vpandnd   zmm26{k1}, zmm3, zmm3
        vextractf32x8 ymm29, zmm28, 1
        vextractf32x8 ymm30, zmm3, 1
        vcvtps2pd zmm1, ymm28 {sae}
        vcvtps2pd zmm0, ymm29 {sae}
        vcvtps2pd zmm4, ymm3 {sae}
        vcvtps2pd zmm5, ymm30 {sae}
        vptestmd  k0, zmm26, zmm26
        vmovups   zmm28, ZMMWORD PTR [__svml_scos_ha_data_internal+5248]
        vfnmadd231pd zmm4, zmm31, zmm1 {rn-sae}
        vfnmadd231pd zmm5, zmm31, zmm0 {rn-sae}
        vmovups   zmm31, ZMMWORD PTR [__svml_scos_ha_data_internal+5056]
        kortestw  k0, k0
        vfnmadd213pd zmm0, zmm31, zmm5 {rn-sae}
        vfnmadd213pd zmm1, zmm31, zmm4 {rn-sae}
        vmulpd    zmm29, zmm0, zmm0 {rn-sae}
        vmulpd    zmm25, zmm1, zmm1 {rn-sae}
        vmovaps   zmm24, zmm28
        vfmadd231pd zmm28, zmm21, zmm29 {rn-sae}
        vfmadd231pd zmm24, zmm21, zmm25 {rn-sae}
        vfmadd213pd zmm28, zmm29, zmm22 {rn-sae}
        vfmadd213pd zmm24, zmm25, zmm22 {rn-sae}
        vfmadd213pd zmm28, zmm29, zmm23 {rn-sae}
        vfmadd213pd zmm24, zmm25, zmm23 {rn-sae}
        vmulpd    zmm4, zmm28, zmm29 {rn-sae}
        vmulpd    zmm30, zmm24, zmm25 {rn-sae}
        vfmadd213pd zmm4, zmm0, zmm0 {rn-sae}
        vfmadd213pd zmm30, zmm1, zmm1 {rn-sae}
        vcvtpd2ps ymm0, zmm4 {rn-sae}
        vcvtpd2ps ymm1, zmm30 {rn-sae}
        vinsertf32x8 zmm1, zmm1, ymm0, 1
        vxorps    zmm0, zmm1, zmm2
        jne       _B6_17

_B6_2::

        test      eax, eax
        jne       _B6_4

_B6_3::

        vmovups   zmm21, ZMMWORD PTR [1264+rsp]
        mov       r13, QWORD PTR [1256+rsp]
        add       rsp, 1336
        ret

_B6_4::

        vstmxcsr  DWORD PTR [1248+rsp]

_B6_5::

        movzx     ecx, WORD PTR [1248+rsp]
        mov       edx, ecx
        or        edx, 8064
        cmp       ecx, edx
        je        _B6_7

_B6_6::

        mov       DWORD PTR [1248+rsp], edx
        vldmxcsr  DWORD PTR [1248+rsp]

_B6_7::

        vmovups   ZMMWORD PTR [r13], zmm27
        vmovups   ZMMWORD PTR [64+r13], zmm0
        test      eax, eax
        jne       _B6_12

_B6_8::

        cmp       ecx, edx
        je        _B6_3

_B6_9::

        vstmxcsr  DWORD PTR [1248+rsp]
        mov       eax, DWORD PTR [1248+rsp]

_B6_10::

        and       eax, -8065
        or        eax, ecx
        mov       DWORD PTR [1248+rsp], eax
        vldmxcsr  DWORD PTR [1248+rsp]
        jmp       _B6_3

_B6_12::

        xor       r8d, r8d
        kmovw     WORD PTR [1016+rsp], k4
        kmovw     WORD PTR [1008+rsp], k5
        kmovw     WORD PTR [1000+rsp], k6
        kmovw     WORD PTR [992+rsp], k7
        vmovups   ZMMWORD PTR [928+rsp], zmm6
        vmovups   ZMMWORD PTR [864+rsp], zmm7
        vmovups   ZMMWORD PTR [800+rsp], zmm8
        vmovups   ZMMWORD PTR [736+rsp], zmm9
        vmovups   ZMMWORD PTR [672+rsp], zmm10
        vmovups   ZMMWORD PTR [608+rsp], zmm11
        vmovups   ZMMWORD PTR [544+rsp], zmm12
        vmovups   ZMMWORD PTR [480+rsp], zmm13
        vmovups   ZMMWORD PTR [416+rsp], zmm14
        vmovups   ZMMWORD PTR [352+rsp], zmm15
        vmovups   ZMMWORD PTR [288+rsp], zmm16
        vmovups   ZMMWORD PTR [224+rsp], zmm17
        vmovups   ZMMWORD PTR [160+rsp], zmm18
        vmovups   ZMMWORD PTR [96+rsp], zmm19
        vmovups   ZMMWORD PTR [32+rsp], zmm20
        mov       QWORD PTR [1040+rsp], rbx
        mov       ebx, r8d
        mov       QWORD PTR [1032+rsp], rsi
        mov       esi, ecx
        mov       QWORD PTR [1024+rsp], rdi
        mov       edi, eax
        mov       QWORD PTR [1048+rsp], rbp
        mov       ebp, edx

_B6_13::

        bt        edi, ebx
        jc        _B6_16

_B6_14::

        inc       ebx
        cmp       ebx, 16
        jl        _B6_13

_B6_15::

        kmovw     k4, WORD PTR [1016+rsp]
        mov       edx, ebp
        kmovw     k5, WORD PTR [1008+rsp]
        kmovw     k6, WORD PTR [1000+rsp]
        kmovw     k7, WORD PTR [992+rsp]
        vmovups   zmm6, ZMMWORD PTR [928+rsp]
        vmovups   zmm7, ZMMWORD PTR [864+rsp]
        vmovups   zmm8, ZMMWORD PTR [800+rsp]
        vmovups   zmm9, ZMMWORD PTR [736+rsp]
        vmovups   zmm10, ZMMWORD PTR [672+rsp]
        vmovups   zmm11, ZMMWORD PTR [608+rsp]
        vmovups   zmm12, ZMMWORD PTR [544+rsp]
        vmovups   zmm13, ZMMWORD PTR [480+rsp]
        vmovups   zmm14, ZMMWORD PTR [416+rsp]
        vmovups   zmm15, ZMMWORD PTR [352+rsp]
        vmovups   zmm16, ZMMWORD PTR [288+rsp]
        vmovups   zmm17, ZMMWORD PTR [224+rsp]
        vmovups   zmm18, ZMMWORD PTR [160+rsp]
        vmovups   zmm19, ZMMWORD PTR [96+rsp]
        vmovups   zmm20, ZMMWORD PTR [32+rsp]
        vmovups   zmm0, ZMMWORD PTR [64+r13]
        mov       rbx, QWORD PTR [1040+rsp]
        mov       ecx, esi
        mov       rsi, QWORD PTR [1032+rsp]
        mov       rdi, QWORD PTR [1024+rsp]
        mov       rbp, QWORD PTR [1048+rsp]
        jmp       _B6_8

_B6_16::

        vzeroupper
        lea       rcx, QWORD PTR [r13+rbx*4]
        lea       rdx, QWORD PTR [64+r13+rbx*4]

        call      __svml_scos_ha_cout_rare_internal
        jmp       _B6_14

_B6_17::

        vmovups   zmm22, ZMMWORD PTR [__svml_scos_ha_data_internal+4224]
        lea       rdx, QWORD PTR [__ImageBase]
        vpcmpeqd  k2, zmm0, zmm0
        vpcmpeqd  k3, zmm0, zmm0
        vandps    zmm5, zmm22, zmm3
        vpternlogd zmm23, zmm23, zmm23, 255
        vcmpps    k1, zmm5, zmm22, 4 {sae}
        vmovups   zmm22, ZMMWORD PTR [_2il0floatpacket_63]
        mov       r8, rdx
        mov       rcx, rdx
        mov       r9, rdx
        mov       r10, rdx
        mov       r11, rdx
        vpandd    zmm31, zmm27, ZMMWORD PTR [_2il0floatpacket_60]
        vpandnd   zmm23{k1}, zmm5, zmm5
        vpsrld    zmm28, zmm31, 23
        vptestmd  k0, zmm23, zmm23
        vpcmpeqd  k1, zmm0, zmm0
        vpslld    zmm2, zmm28, 1
        kmovw     eax, k0
        vpaddd    zmm24, zmm2, zmm28
        vpslld    zmm3, zmm24, 2
        vpxord    zmm23, zmm23, zmm23
        vpxord    zmm25, zmm25, zmm25
        vpxord    zmm5, zmm5, zmm5
        vpandd    zmm4, zmm27, ZMMWORD PTR [_2il0floatpacket_61]
        vpaddd    zmm31, zmm4, ZMMWORD PTR [_2il0floatpacket_62]
        vgatherdps zmm23{k1}, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+8+r8+zmm3]
        vgatherdps zmm25{k2}, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+rdx+zmm3]
        vgatherdps zmm5{k3}, DWORD PTR [imagerel(__svml_scos_ha_reduction_data_internal)+4+rcx+zmm3]
        vpcmpeqd  k1, zmm0, zmm0
        vpsrld    zmm29, zmm23, 16
        vpsrld    zmm24, zmm31, 16
        vpsrld    zmm21, zmm25, 16
        vpsrld    zmm1, zmm5, 16
        vpandd    zmm30, zmm31, zmm22
        vpmulld   zmm2, zmm24, zmm29
        vpmulld   zmm29, zmm30, zmm29
        vpsrld    zmm29, zmm29, 16
        vpaddd    zmm2, zmm2, zmm29
        vpandd    zmm25, zmm25, zmm22
        vpandd    zmm28, zmm5, zmm22
        vpandd    zmm23, zmm23, zmm22
        vpmulld   zmm5, zmm24, zmm25
        vpmulld   zmm4, zmm24, zmm1
        vpmulld   zmm3, zmm24, zmm28
        vpmulld   zmm24, zmm24, zmm23
        vpmulld   zmm23, zmm30, zmm21
        vpmulld   zmm21, zmm30, zmm25
        vpmulld   zmm25, zmm30, zmm1
        vpmulld   zmm1, zmm30, zmm28
        vpsrld    zmm30, zmm1, 16
        vpsrld    zmm31, zmm25, 16
        vpsrld    zmm28, zmm21, 16
        vpaddd    zmm29, zmm3, zmm30
        vpaddd    zmm4, zmm4, zmm31
        vpaddd    zmm3, zmm5, zmm28
        vpandd    zmm1, zmm1, zmm22
        vpandd    zmm30, zmm25, zmm22
        vpaddd    zmm25, zmm1, zmm2
        vpaddd    zmm5, zmm30, zmm29
        vpsrld    zmm2, zmm24, 16
        vpandd    zmm28, zmm23, zmm22
        vpaddd    zmm23, zmm2, zmm25
        vpaddd    zmm1, zmm28, zmm3
        vpsrld    zmm24, zmm23, 16
        vpaddd    zmm30, zmm24, zmm5
        vpsrld    zmm3, zmm30, 16
        vpandd    zmm21, zmm21, zmm22
        vpaddd    zmm4, zmm21, zmm4
        vpaddd    zmm29, zmm3, zmm4
        vpslld    zmm3, zmm30, 16
        vmovups   zmm4, ZMMWORD PTR [_2il0floatpacket_66]
        vpsrld    zmm21, zmm29, 16
        vpaddd    zmm31, zmm21, zmm1
        vpandd    zmm2, zmm23, zmm22
        vpandd    zmm24, zmm29, zmm22
        vpslld    zmm22, zmm31, 16
        vpaddd    zmm30, zmm3, zmm2
        vpternlogd zmm2, zmm2, zmm2, 255
        vpaddd    zmm24, zmm22, zmm24
        vpsrld    zmm21, zmm24, 9
        vpandd    zmm3, zmm27, ZMMWORD PTR [_2il0floatpacket_64]
        vpternlogd zmm21, zmm3, ZMMWORD PTR [_2il0floatpacket_65], 246
        vaddps    zmm22, zmm4, zmm21 {rn-sae}
        vsubps    zmm25, zmm22, zmm4 {rn-sae}
        vsubps    zmm31, zmm21, zmm25 {rn-sae}
        vpandd    zmm24, zmm24, ZMMWORD PTR [_2il0floatpacket_71]
        vpandd    zmm5, zmm30, ZMMWORD PTR [_2il0floatpacket_69]
        vpslld    zmm4, zmm24, 14
        vpsrld    zmm30, zmm30, 18
        vpslld    zmm1, zmm5, 5
        vmovups   zmm5, ZMMWORD PTR [_2il0floatpacket_75]
        vpxord    zmm21, zmm3, ZMMWORD PTR [_2il0floatpacket_70]
        vpternlogd zmm30, zmm4, zmm21, 254
        vsubps    zmm24, zmm30, zmm21 {rn-sae}
        vmovups   zmm21, ZMMWORD PTR [_2il0floatpacket_72]
        vmovaps   zmm4, zmm21
        vpandd    zmm29, zmm22, ZMMWORD PTR [_2il0floatpacket_67]
        vaddps    zmm22, zmm31, zmm24 {rn-sae}
        vpslld    zmm29, zmm29, 4
        vsubps    zmm31, zmm31, zmm22 {rn-sae}
        vaddps    zmm24, zmm24, zmm31 {rn-sae}
        vpxord    zmm28, zmm3, ZMMWORD PTR [_2il0floatpacket_68]
        vpord     zmm23, zmm1, zmm28
        vandps    zmm1, zmm27, ZMMWORD PTR [_2il0floatpacket_74]
        vsubps    zmm25, zmm23, zmm28 {rn-sae}
        vpternlogd zmm28, zmm28, zmm28, 255
        vmulps    zmm23, zmm22, zmm21 {rn-sae}
        vcmpps    k2, zmm1, zmm5, 26 {sae}
        vcmpps    k3, zmm1, zmm5, 22 {sae}
        vmovups   zmm3, ZMMWORD PTR [_2il0floatpacket_73]
        vfmsub213ps zmm4, zmm22, zmm23 {rn-sae}
        vaddps    zmm30, zmm24, zmm25 {rn-sae}
        vfmadd213ps zmm22, zmm3, zmm4 {rn-sae}
        vfmadd213ps zmm30, zmm21, zmm22 {rn-sae}
        vpandnd   zmm28{k2}, zmm1, zmm1
        vpandnd   zmm2{k3}, zmm1, zmm1
        vpxord    zmm1, zmm1, zmm1
        vgatherdps zmm1{k1}, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+r9+zmm29]
        vpcmpeqd  k2, zmm0, zmm0
        vpcmpeqd  k1, zmm0, zmm0
        vpcmpeqd  k3, zmm0, zmm0
        vandps    zmm3, zmm28, zmm23
        vandps    zmm4, zmm28, zmm30
        vmovups   zmm30, ZMMWORD PTR [__svml_scos_ha_data_internal+4288]
        vpternlogd zmm3, zmm2, zmm27, 248
        vmovaps   zmm22, zmm3
        vmulps    zmm5, zmm3, zmm3 {rn-sae}
        vmovaps   zmm24, zmm3
        vpxord    zmm25, zmm25, zmm25
        vpxord    zmm23, zmm23, zmm23
        vpxord    zmm21, zmm21, zmm21
        vpandnd   zmm0, zmm26, zmm0
        vgatherdps zmm25{k2}, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+4+r10+zmm29]
        vgatherdps zmm23{k1}, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+12+rdx+zmm29]
        vgatherdps zmm21{k3}, DWORD PTR [imagerel(__svml_scos_ha_data_internal)+8+r11+zmm29]
        vmovups   zmm29, ZMMWORD PTR [__svml_scos_ha_data_internal+4352]
        vfmadd213ps zmm22, zmm23, zmm25 {rn-sae}
        vfmadd231ps zmm30, zmm29, zmm5 {rn-sae}
        vsubps    zmm28, zmm25, zmm22 {rn-sae}
        vfmadd132ps zmm24, zmm22, zmm1 {rn-sae}
        vmulps    zmm31, zmm30, zmm5 {rn-sae}
        vfmadd231ps zmm28, zmm23, zmm3 {rn-sae}
        vsubps    zmm2, zmm22, zmm24 {rn-sae}
        vfmadd231ps zmm2, zmm3, zmm1 {rn-sae}
        vaddps    zmm22, zmm2, zmm28 {rn-sae}
        vaddps    zmm2, zmm1, zmm23 {rn-sae}
        vmovups   zmm23, ZMMWORD PTR [__svml_scos_ha_data_internal+4416]
        vmovups   zmm1, ZMMWORD PTR [__svml_scos_ha_data_internal+4480]
        vmulps    zmm28, zmm31, zmm3 {rn-sae}
        vfmadd231ps zmm23, zmm1, zmm5 {rn-sae}
        vfnmadd213ps zmm3, zmm25, zmm2 {rn-sae}
        vmulps    zmm5, zmm23, zmm5 {rn-sae}
        vfmadd213ps zmm4, zmm3, zmm21 {rn-sae}
        vfmadd213ps zmm28, zmm3, zmm22 {rn-sae}
        vfmadd213ps zmm5, zmm25, zmm4 {rn-sae}
        vaddps    zmm3, zmm5, zmm28 {rn-sae}
        vaddps    zmm4, zmm24, zmm3 {rn-sae}
        vpternlogd zmm0, zmm4, zmm26, 248
        jmp       _B6_2
        ALIGN     16

_B6_18::

__svml_cosf16_ha_z0 ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf16_ha_z0_B1_B10:
	DD	401409
	DD	10343456
	DD	5199896
	DD	10944779

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B6_1
	DD	imagerel _B6_12
	DD	imagerel _unwind___svml_cosf16_ha_z0_B1_B10

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf16_ha_z0_B12_B16:
	DD	3470081
	DD	8606963
	DD	8418537
	DD	8479967
	DD	8533204
	DD	149708
	DD	407745
	DD	665782
	DD	923819
	DD	1181856
	DD	1505429
	DD	1763466
	DD	2021503
	DD	2279540
	DD	2537577
	DD	2795614
	DD	3053651
	DD	3311688
	DD	3569725
	DD	3827762
	DD	8157991
	DD	8219422
	DD	8280853
	DD	8342284
	DD	5199872
	DD	10343424
	DD	10944768

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B6_12
	DD	imagerel _B6_17
	DD	imagerel _unwind___svml_cosf16_ha_z0_B12_B16

.pdata	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_cosf16_ha_z0_B17_B17:
	DD	393217
	DD	5199872
	DD	10343424
	DD	10944768

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B6_17
	DD	imagerel _B6_18
	DD	imagerel _unwind___svml_cosf16_ha_z0_B17_B17

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_TEXT	SEGMENT      'CODE'

TXTST6:

_TEXT	ENDS
_TEXT	SEGMENT      'CODE'

       ALIGN     16
	PUBLIC __svml_scos_ha_cout_rare_internal

__svml_scos_ha_cout_rare_internal	PROC

_B7_1::

        DB        243
        DB        15
        DB        30
        DB        250
L233::

        sub       rsp, 40
        mov       r8, rdx
        mov       edx, DWORD PTR [rcx]
        movzx     eax, WORD PTR [2+rcx]
        mov       DWORD PTR [32+rsp], edx
        and       eax, 32640
        shr       edx, 24
        and       edx, 127
        cmp       eax, 32640
        jne       _B7_6

_B7_2::

        mov       BYTE PTR [35+rsp], dl
        cmp       DWORD PTR [32+rsp], 2139095040
        jne       _B7_4

_B7_3::

        movss     xmm0, DWORD PTR [rcx]
        mov       eax, 1
        mulss     xmm0, DWORD PTR [_vmlsCosHATab]
        movss     DWORD PTR [r8], xmm0
        add       rsp, 40
        ret

_B7_4::

        movss     xmm0, DWORD PTR [rcx]
        xor       eax, eax
        mulss     xmm0, DWORD PTR [rcx]
        movss     DWORD PTR [r8], xmm0

_B7_5::

        add       rsp, 40
        ret

_B7_6::

        xor       eax, eax
        add       rsp, 40
        ret
        ALIGN     16

_B7_7::

__svml_scos_ha_cout_rare_internal ENDP

_TEXT	ENDS
.xdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H
_unwind___svml_scos_ha_cout_rare_internal_B1_B6:
	DD	67585
	DD	16904

.xdata	ENDS
.pdata	SEGMENT  DWORD   READ  ''

	ALIGN 004H

	DD	imagerel _B7_1
	DD	imagerel _B7_7
	DD	imagerel _unwind___svml_scos_ha_cout_rare_internal_B1_B6

.pdata	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS

_RDATA	SEGMENT     READ PAGE   'DATA'
	ALIGN  32
_2il0floatpacket_60	DD	07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H
_2il0floatpacket_61	DD	0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH
_2il0floatpacket_62	DD	000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H
_2il0floatpacket_63	DD	00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH
_2il0floatpacket_64	DD	080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H
_2il0floatpacket_65	DD	03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H
_2il0floatpacket_66	DD	047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H
_2il0floatpacket_67	DD	0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH
_2il0floatpacket_68	DD	028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H
_2il0floatpacket_69	DD	00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH
_2il0floatpacket_70	DD	034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H
_2il0floatpacket_71	DD	0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH
_2il0floatpacket_72	DD	040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH
_2il0floatpacket_73	DD	0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH
_2il0floatpacket_74	DD	07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH
_2il0floatpacket_75	DD	035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H
	PUBLIC __svml_scos_ha_reduction_data_internal
__svml_scos_ha_reduction_data_internal	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	0
	DD	1
	DD	0
	DD	0
	DD	2
	DD	0
	DD	0
	DD	5
	DD	0
	DD	0
	DD	10
	DD	0
	DD	0
	DD	20
	DD	0
	DD	0
	DD	40
	DD	0
	DD	0
	DD	81
	DD	0
	DD	0
	DD	162
	DD	0
	DD	0
	DD	325
	DD	0
	DD	0
	DD	651
	DD	0
	DD	0
	DD	1303
	DD	0
	DD	0
	DD	2607
	DD	0
	DD	0
	DD	5215
	DD	0
	DD	0
	DD	10430
	DD	0
	DD	0
	DD	20860
	DD	0
	DD	0
	DD	41721
	DD	0
	DD	0
	DD	83443
	DD	0
	DD	0
	DD	166886
	DD	0
	DD	0
	DD	333772
	DD	0
	DD	0
	DD	667544
	DD	0
	DD	0
	DD	1335088
	DD	0
	DD	0
	DD	2670176
	DD	0
	DD	0
	DD	5340353
	DD	0
	DD	0
	DD	10680707
	DD	0
	DD	0
	DD	21361414
	DD	0
	DD	0
	DD	42722829
	DD	0
	DD	0
	DD	85445659
	DD	0
	DD	0
	DD	170891318
	DD	0
	DD	0
	DD	341782637
	DD	0
	DD	0
	DD	683565275
	DD	0
	DD	0
	DD	1367130551
	DD	0
	DD	0
	DD	2734261102
	DD	0
	DD	1
	DD	1173554908
	DD	0
	DD	2
	DD	2347109817
	DD	0
	DD	5
	DD	399252338
	DD	0
	DD	10
	DD	798504676
	DD	0
	DD	20
	DD	1597009353
	DD	0
	DD	40
	DD	3194018707
	DD	0
	DD	81
	DD	2093070119
	DD	0
	DD	162
	DD	4186140238
	DD	0
	DD	325
	DD	4077313180
	DD	0
	DD	651
	DD	3859659065
	DD	0
	DD	1303
	DD	3424350834
	DD	0
	DD	2607
	DD	2553734372
	DD	0
	DD	5215
	DD	812501448
	DD	0
	DD	10430
	DD	1625002897
	DD	0
	DD	20860
	DD	3250005794
	DD	0
	DD	41721
	DD	2205044292
	DD	0
	DD	83443
	DD	115121288
	DD	0
	DD	166886
	DD	230242576
	DD	0
	DD	333772
	DD	460485152
	DD	0
	DD	667544
	DD	920970305
	DD	0
	DD	1335088
	DD	1841940610
	DD	0
	DD	2670176
	DD	3683881221
	DD	0
	DD	5340353
	DD	3072795146
	DD	0
	DD	10680707
	DD	1850622997
	DD	0
	DD	21361414
	DD	3701245994
	DD	0
	DD	42722829
	DD	3107524692
	DD	0
	DD	85445659
	DD	1920082089
	DD	0
	DD	170891318
	DD	3840164178
	DD	0
	DD	341782637
	DD	3385361061
	DD	0
	DD	683565275
	DD	2475754826
	DD	0
	DD	1367130551
	DD	656542356
	DD	0
	DD	2734261102
	DD	1313084713
	DD	1
	DD	1173554908
	DD	2626169427
	DD	2
	DD	2347109817
	DD	957371559
	DD	5
	DD	399252338
	DD	1914743119
	DD	10
	DD	798504676
	DD	3829486239
	DD	20
	DD	1597009353
	DD	3364005183
	DD	40
	DD	3194018707
	DD	2433043071
	DD	81
	DD	2093070119
	DD	571118846
	DD	162
	DD	4186140238
	DD	1142237692
	DD	325
	DD	4077313180
	DD	2284475384
	DD	651
	DD	3859659065
	DD	273983472
	DD	1303
	DD	3424350834
	DD	547966945
	DD	2607
	DD	2553734372
	DD	1095933890
	DD	5215
	DD	812501448
	DD	2191867780
	DD	10430
	DD	1625002897
	DD	88768265
	DD	20860
	DD	3250005794
	DD	177536531
	DD	41721
	DD	2205044292
	DD	355073063
	DD	83443
	DD	115121288
	DD	710146126
	DD	166886
	DD	230242576
	DD	1420292253
	DD	333772
	DD	460485152
	DD	2840584506
	DD	667544
	DD	920970305
	DD	1386201717
	DD	1335088
	DD	1841940610
	DD	2772403434
	DD	2670176
	DD	3683881221
	DD	1249839573
	DD	5340353
	DD	3072795146
	DD	2499679147
	DD	10680707
	DD	1850622997
	DD	704390999
	DD	21361414
	DD	3701245994
	DD	1408781999
	DD	42722829
	DD	3107524692
	DD	2817563999
	DD	85445659
	DD	1920082089
	DD	1340160702
	DD	170891318
	DD	3840164178
	DD	2680321405
	DD	341782637
	DD	3385361061
	DD	1065675514
	DD	683565275
	DD	2475754826
	DD	2131351028
	DD	1367130551
	DD	656542356
	DD	4262702056
	DD	2734261102
	DD	1313084713
	DD	4230436817
	DD	1173554908
	DD	2626169427
	DD	4165906339
	DD	2347109817
	DD	957371559
	DD	4036845383
	DD	399252338
	DD	1914743119
	DD	3778723471
	DD	798504676
	DD	3829486239
	DD	3262479647
	DD	1597009353
	DD	3364005183
	DD	2229991998
	DD	3194018707
	DD	2433043071
	DD	165016701
	DD	2093070119
	DD	571118846
	DD	330033402
	DD	4186140238
	DD	1142237692
	DD	660066805
	DD	4077313180
	DD	2284475384
	DD	1320133610
	DD	3859659065
	DD	273983472
	DD	2640267220
	DD	3424350834
	DD	547966945
	DD	985567145
	DD	2553734372
	DD	1095933890
	DD	1971134291
	DD	812501448
	DD	2191867780
	DD	3942268582
	DD	1625002897
	DD	88768265
	DD	3589569869
	DD	3250005794
	DD	177536531
	DD	2884172442
	DD	2205044292
	DD	355073063
	DD	1473377588
	DD	115121288
	DD	710146126
	DD	2946755177
	DD	230242576
	DD	1420292253
	DD	1598543059
	DD	460485152
	DD	2840584506
	DD	3197086118
	DD	920970305
	DD	1386201717
	DD	2099204941
	DD	1841940610
	DD	2772403434
	DD	4198409883
	DD	3683881221
	DD	1249839573
	DD	4101852471
	DD	3072795146
	DD	2499679147
	DD	3908737646
	DD	1850622997
	DD	704390999
	DD	3522507997
	DD	3701245994
	DD	1408781999
	DD	2750048699
	DD	3107524692
	DD	2817563999
	DD	1205130103
	DD	1920082089
	DD	1340160702
	DD	2410260206
	DD	3840164178
	DD	2680321405
	DD	525553116
	DD	3385361061
	DD	1065675514
	DD	1051106232
	DD	2475754826
	DD	2131351028
	DD	2102212464
	DD	656542356
	DD	4262702056
	DD	4204424928
	DD	1313084713
	DD	4230436817
	DD	4113882560
	DD	2626169427
	DD	4165906339
	DD	3932797825
	DD	957371559
	DD	4036845383
	DD	3570628355
	DD	1914743119
	DD	3778723471
	DD	2846289414
	DD	3829486239
	DD	3262479647
	DD	1397611533
	DD	3364005183
	DD	2229991998
	DD	2795223067
	DD	2433043071
	DD	165016701
	DD	1295478838
	DD	571118846
	DD	330033402
	DD	2590957677
	DD	1142237692
	DD	660066805
	DD	886948059
	DD	2284475384
	DD	1320133610
	DD	1773896118
	DD	273983472
	DD	2640267220
	DD	3547792237
	DD	547966945
	DD	985567145
	DD	2800617179
	DD	1095933890
	DD	1971134291
	DD	1306267062
	DD	2191867780
	DD	3942268582
	DD	2612534124
	DD	88768265
	DD	3589569869
	DD	930100952
	DD	177536531
	DD	2884172442
	DD	1860201905
	DD	355073063
	DD	1473377588
	DD	3720403810
	DD	710146126
	DD	2946755177
	DD	3145840325
	DD	1420292253
	DD	1598543059
	DD	1996713354
	DD	2840584506
	DD	3197086118
	DD	3993426708
	DD	1386201717
	DD	2099204941
	DD	3691886121
	DD	2772403434
	DD	4198409883
	DD	3088804946
	DD	1249839573
	DD	4101852471
	DD	1882642597
	DD	2499679147
	DD	3908737646
	DD	3765285194
	DD	704390999
	DD	3522507997
	DD	3235603093
	DD	1408781999
	DD	2750048699
	DD	2176238891
	DD	2817563999
	DD	1205130103
	DD	57510486
	DD	1340160702
	DD	2410260206
	DD	115020972
	DD	2680321405
	DD	525553116
	DD	230041945
	DD	1065675514
	DD	1051106232
	DD	460083891
	DD	2131351028
	DD	2102212464
	DD	920167782
	DD	4262702056
	DD	4204424928
	DD	1840335564
	DD	4230436817
	DD	4113882560
	DD	3680671129
	DD	4165906339
	DD	3932797825
	DD	3066374962
	DD	4036845383
	DD	3570628355
	DD	1837782628
	DD	3778723471
	DD	2846289414
	DD	3675565257
	DD	3262479647
	DD	1397611533
	DD	3056163219
	DD	2229991998
	DD	2795223067
	DD	1817359143
	DD	165016701
	DD	1295478838
	DD	3634718287
	DD	330033402
	DD	2590957677
	DD	2974469278
	DD	660066805
	DD	886948059
	DD	1653971260
	DD	1320133610
	DD	1773896118
	DD	3307942520
	DD	2640267220
	DD	3547792237
	DD	2320917745
	DD	985567145
	DD	2800617179
	DD	346868194
	DD	1971134291
	DD	1306267062
	DD	693736388
	DD	3942268582
	DD	2612534124
	DD	1387472776
	DD	3589569869
	DD	930100952
	DD	2774945552
	DD	2884172442
	DD	1860201905
	DD	1254923809
	DD	1473377588
	DD	3720403810
	DD	2509847619
	DD	2946755177
	DD	3145840325
	DD	724727943
	DD	1598543059
	DD	1996713354
	DD	1449455886
	DD	3197086118
	DD	3993426708
	DD	2898911772
	DD	2099204941
	DD	3691886121
	DD	1502856249
	DD	4198409883
	DD	3088804946
	DD	3005712498
	DD	4101852471
	DD	1882642597
	DD	1716457700
	DD	3908737646
	DD	3765285194
	DD	3432915400
	DD	3522507997
	DD	3235603093
	DD	2570863504
	DD	2750048699
	DD	2176238891
	DD	846759712
	DD	1205130103
	DD	57510486
	DD	1693519425
	DD	2410260206
	DD	115020972
	DD	3387038850
	DD	525553116
	DD	230041945
	DD	2479110404
	DD	1051106232
	DD	460083891
	DD	663253512
	DD	2102212464
	DD	920167782
	DD	1326507024
	DD	4204424928
	DD	1840335564
	DD	2653014048
	DD	4113882560
	DD	3680671129
	DD	1011060801
	DD	3932797825
	DD	3066374962
	DD	2022121603
	DD	3570628355
	DD	1837782628
	DD	4044243207
	DD	2846289414
	DD	3675565257
	DD	3793519119
	DD	1397611533
	DD	3056163219
	DD	3292070943
	DD	2795223067
	DD	1817359143
	DD	2289174591
	DD	1295478838
	DD	3634718287
	DD	283381887
	DD	2590957677
	DD	2974469278
	DD	566763775
	PUBLIC __svml_scos_ha_data_internal
__svml_scos_ha_data_internal	DD	0
	DD	1065353216
	DD	0
	DD	0
	DD	1004262721
	DD	1065348163
	DD	814009613
	DD	3170893824
	DD	1012667202
	DD	1065333007
	DD	836655967
	DD	3179282432
	DD	3157608485
	DD	1065307757
	DD	852498564
	DD	3179282432
	DD	1021119272
	DD	1065272429
	DD	838093129
	DD	3187671040
	DD	992588201
	DD	1065227044
	DD	3002197507
	DD	3187671040
	DD	3165783068
	DD	1065171628
	DD	2969000681
	DD	3187671040
	DD	3174843017
	DD	1065106216
	DD	2989610635
	DD	3187671040
	DD	1029761272
	DD	1065030846
	DD	855602635
	DD	3196059648
	DD	1023221605
	DD	1064945565
	DD	851856985
	DD	3196059648
	DD	1004930693
	DD	1064850424
	DD	2987244005
	DD	3196059648
	DD	3163089201
	DD	1064745479
	DD	846006572
	DD	3196059648
	DD	3173319052
	DD	1064630795
	DD	2996018466
	DD	3196059648
	DD	3179441043
	DD	1064506439
	DD	851742225
	DD	3196059648
	DD	3182555983
	DD	1064372488
	DD	840880349
	DD	3196059648
	DD	1041201069
	DD	1064229022
	DD	2995991516
	DD	3204448256
	DD	1039156139
	DD	1064076126
	DD	854796500
	DD	3204448256
	DD	1036128472
	DD	1063913895
	DD	3001754476
	DD	3204448256
	DD	1033133567
	DD	1063742424
	DD	2998678409
	DD	3204448256
	DD	1028547674
	DD	1063561817
	DD	823789818
	DD	3204448256
	DD	1021989220
	DD	1063372184
	DD	3001545765
	DD	3204448256
	DD	1005106760
	DD	1063173637
	DD	851900755
	DD	3204448256
	DD	3160870706
	DD	1062966298
	DD	841166280
	DD	3204448256
	DD	3171899818
	DD	1062750291
	DD	2994560960
	DD	3204448256
	DD	3177422237
	DD	1062525745
	DD	848357914
	DD	3204448256
	DD	3181068627
	DD	1062292797
	DD	806113028
	DD	3204448256
	DD	3183738367
	DD	1062051586
	DD	847147240
	DD	3204448256
	DD	3186359946
	DD	1061802258
	DD	848897600
	DD	3204448256
	DD	3188301413
	DD	1061544963
	DD	850481524
	DD	3204448256
	DD	3189561687
	DD	1061279856
	DD	851442039
	DD	3204448256
	DD	3190795559
	DD	1061007097
	DD	832220140
	DD	3204448256
	DD	3192002283
	DD	1060726850
	DD	2994798599
	DD	3204448256
	DD	1050015258
	DD	1060439283
	DD	844097402
	DD	3212836864
	DD	1049440125
	DD	1060144571
	DD	2997759282
	DD	3212836864
	DD	1048879630
	DD	1059842890
	DD	2998350134
	DD	3212836864
	DD	1048092223
	DD	1059534422
	DD	2986574659
	DD	3212836864
	DD	1047031795
	DD	1059219353
	DD	841032635
	DD	3212836864
	DD	1046002615
	DD	1058897873
	DD	848430348
	DD	3212836864
	DD	1045005303
	DD	1058570176
	DD	2982650867
	DD	3212836864
	DD	1044040460
	DD	1058236458
	DD	852349230
	DD	3212836864
	DD	1043108667
	DD	1057896922
	DD	2991207143
	DD	3212836864
	DD	1042210485
	DD	1057551771
	DD	2998815566
	DD	3212836864
	DD	1041346455
	DD	1057201213
	DD	2992349186
	DD	3212836864
	DD	1040517098
	DD	1056726311
	DD	2978016425
	DD	3212836864
	DD	1039258436
	DD	1056004842
	DD	2986287417
	DD	3212836864
	DD	1037741368
	DD	1055273845
	DD	2983839604
	DD	3212836864
	DD	1036296515
	DD	1054533760
	DD	840832460
	DD	3212836864
	DD	1034924748
	DD	1053785034
	DD	829045603
	DD	3212836864
	DD	1033626892
	DD	1053028117
	DD	836097324
	DD	3212836864
	DD	1032403730
	DD	1052263466
	DD	2993707942
	DD	3212836864
	DD	1030713214
	DD	1051491540
	DD	2988789250
	DD	3212836864
	DD	1028569994
	DD	1050712805
	DD	2990442912
	DD	3212836864
	DD	1026580309
	DD	1049927729
	DD	846027248
	DD	3212836864
	DD	1024745356
	DD	1049136787
	DD	824999326
	DD	3212836864
	DD	1022722308
	DD	1048104908
	DD	2971391005
	DD	3212836864
	DD	1019677780
	DD	1046502419
	DD	833086710
	DD	3212836864
	DD	1016948784
	DD	1044891074
	DD	2967836285
	DD	3212836864
	DD	1014052363
	DD	1043271842
	DD	823224313
	DD	3212836864
	DD	1009865986
	DD	1041645699
	DD	837346836
	DD	3212836864
	DD	1006005820
	DD	1039839859
	DD	2970970319
	DD	3212836864
	DD	1000196465
	DD	1036565814
	DD	2960495349
	DD	3212836864
	DD	993104536
	DD	1033283845
	DD	2975014497
	DD	3212836864
	DD	983425480
	DD	1028193072
	DD	2968461951
	DD	3212836864
	DD	966649823
	DD	1019808432
	DD	2953169304
	DD	3212836864
	DD	0
	DD	0
	DD	0
	DD	3212836864
	DD	966649823
	DD	3167292080
	DD	805685656
	DD	3212836864
	DD	983425480
	DD	3175676720
	DD	820978303
	DD	3212836864
	DD	993104536
	DD	3180767493
	DD	827530849
	DD	3212836864
	DD	1000196465
	DD	3184049462
	DD	813011701
	DD	3212836864
	DD	1006005820
	DD	3187323507
	DD	823486671
	DD	3212836864
	DD	1009865986
	DD	3189129347
	DD	2984830484
	DD	3212836864
	DD	1014052363
	DD	3190755490
	DD	2970707961
	DD	3212836864
	DD	1016948784
	DD	3192374722
	DD	820352637
	DD	3212836864
	DD	1019677780
	DD	3193986067
	DD	2980570358
	DD	3212836864
	DD	1022722308
	DD	3195588556
	DD	823907357
	DD	3212836864
	DD	1024745356
	DD	3196620435
	DD	2972482974
	DD	3212836864
	DD	1026580309
	DD	3197411377
	DD	2993510896
	DD	3212836864
	DD	1028569994
	DD	3198196453
	DD	842959264
	DD	3212836864
	DD	1030713214
	DD	3198975188
	DD	841305602
	DD	3212836864
	DD	1032403730
	DD	3199747114
	DD	846224294
	DD	3212836864
	DD	1033626892
	DD	3200511765
	DD	2983580972
	DD	3212836864
	DD	1034924748
	DD	3201268682
	DD	2976529251
	DD	3212836864
	DD	1036296515
	DD	3202017408
	DD	2988316108
	DD	3212836864
	DD	1037741368
	DD	3202757493
	DD	836355956
	DD	3212836864
	DD	1039258436
	DD	3203488490
	DD	838803769
	DD	3212836864
	DD	1040517098
	DD	3204209959
	DD	830532777
	DD	3212836864
	DD	1041346455
	DD	3204684861
	DD	844865538
	DD	3212836864
	DD	1042210485
	DD	3205035419
	DD	851331918
	DD	3212836864
	DD	1043108667
	DD	3205380570
	DD	843723495
	DD	3212836864
	DD	1044040460
	DD	3205720106
	DD	2999832878
	DD	3212836864
	DD	1045005303
	DD	3206053824
	DD	835167219
	DD	3212836864
	DD	1046002615
	DD	3206381521
	DD	2995913996
	DD	3212836864
	DD	1047031795
	DD	3206703001
	DD	2988516283
	DD	3212836864
	DD	1048092223
	DD	3207018070
	DD	839091011
	DD	3212836864
	DD	1048879630
	DD	3207326538
	DD	850866486
	DD	3212836864
	DD	1049440125
	DD	3207628219
	DD	850275634
	DD	3212836864
	DD	1050015258
	DD	3207922931
	DD	2991581050
	DD	3212836864
	DD	3192002283
	DD	3208210498
	DD	847314951
	DD	3204448256
	DD	3190795559
	DD	3208490745
	DD	2979703788
	DD	3204448256
	DD	3189561687
	DD	3208763504
	DD	2998925687
	DD	3204448256
	DD	3188301413
	DD	3209028611
	DD	2997965172
	DD	3204448256
	DD	3186359946
	DD	3209285906
	DD	2996381248
	DD	3204448256
	DD	3183738367
	DD	3209535234
	DD	2994630888
	DD	3204448256
	DD	3181068627
	DD	3209776445
	DD	2953596676
	DD	3204448256
	DD	3177422237
	DD	3210009393
	DD	2995841562
	DD	3204448256
	DD	3171899818
	DD	3210233939
	DD	847077312
	DD	3204448256
	DD	3160870706
	DD	3210449946
	DD	2988649928
	DD	3204448256
	DD	1005106760
	DD	3210657285
	DD	2999384403
	DD	3204448256
	DD	1021989220
	DD	3210855832
	DD	854062117
	DD	3204448256
	DD	1028547674
	DD	3211045465
	DD	2971273466
	DD	3204448256
	DD	1033133567
	DD	3211226072
	DD	851194761
	DD	3204448256
	DD	1036128472
	DD	3211397543
	DD	854270828
	DD	3204448256
	DD	1039156139
	DD	3211559774
	DD	3002280148
	DD	3204448256
	DD	1041201069
	DD	3211712670
	DD	848507868
	DD	3204448256
	DD	3182555983
	DD	3211856136
	DD	2988363997
	DD	3196059648
	DD	3179441043
	DD	3211990087
	DD	2999225873
	DD	3196059648
	DD	3173319052
	DD	3212114443
	DD	848534818
	DD	3196059648
	DD	3163089201
	DD	3212229127
	DD	2993490220
	DD	3196059648
	DD	1004930693
	DD	3212334072
	DD	839760357
	DD	3196059648
	DD	1023221605
	DD	3212429213
	DD	2999340633
	DD	3196059648
	DD	1029761272
	DD	3212514494
	DD	3003086283
	DD	3196059648
	DD	3174843017
	DD	3212589864
	DD	842126987
	DD	3187671040
	DD	3165783068
	DD	3212655276
	DD	821517033
	DD	3187671040
	DD	992588201
	DD	3212710692
	DD	854713859
	DD	3187671040
	DD	1021119272
	DD	3212756077
	DD	2985576777
	DD	3187671040
	DD	3157608485
	DD	3212791405
	DD	2999982212
	DD	3179282432
	DD	1012667202
	DD	3212816655
	DD	2984139615
	DD	3179282432
	DD	1004262721
	DD	3212831811
	DD	2961493261
	DD	3170893824
	DD	0
	DD	3212836864
	DD	0
	DD	0
	DD	3151746369
	DD	3212831811
	DD	2961493261
	DD	1023410176
	DD	3160150850
	DD	3212816655
	DD	2984139615
	DD	1031798784
	DD	1010124837
	DD	3212791405
	DD	2999982212
	DD	1031798784
	DD	3168602920
	DD	3212756077
	DD	2985576777
	DD	1040187392
	DD	3140071849
	DD	3212710692
	DD	854713859
	DD	1040187392
	DD	1018299420
	DD	3212655276
	DD	821517033
	DD	1040187392
	DD	1027359369
	DD	3212589864
	DD	842126987
	DD	1040187392
	DD	3177244920
	DD	3212514494
	DD	3003086283
	DD	1048576000
	DD	3170705253
	DD	3212429213
	DD	2999340633
	DD	1048576000
	DD	3152414341
	DD	3212334072
	DD	839760357
	DD	1048576000
	DD	1015605553
	DD	3212229127
	DD	2993490220
	DD	1048576000
	DD	1025835404
	DD	3212114443
	DD	848534818
	DD	1048576000
	DD	1031957395
	DD	3211990087
	DD	2999225873
	DD	1048576000
	DD	1035072335
	DD	3211856136
	DD	2988363997
	DD	1048576000
	DD	3188684717
	DD	3211712670
	DD	848507868
	DD	1056964608
	DD	3186639787
	DD	3211559774
	DD	3002280148
	DD	1056964608
	DD	3183612120
	DD	3211397543
	DD	854270828
	DD	1056964608
	DD	3180617215
	DD	3211226072
	DD	851194761
	DD	1056964608
	DD	3176031322
	DD	3211045465
	DD	2971273466
	DD	1056964608
	DD	3169472868
	DD	3210855832
	DD	854062117
	DD	1056964608
	DD	3152590408
	DD	3210657285
	DD	2999384403
	DD	1056964608
	DD	1013387058
	DD	3210449946
	DD	2988649928
	DD	1056964608
	DD	1024416170
	DD	3210233939
	DD	847077312
	DD	1056964608
	DD	1029938589
	DD	3210009393
	DD	2995841562
	DD	1056964608
	DD	1033584979
	DD	3209776445
	DD	2953596676
	DD	1056964608
	DD	1036254719
	DD	3209535234
	DD	2994630888
	DD	1056964608
	DD	1038876298
	DD	3209285906
	DD	2996381248
	DD	1056964608
	DD	1040817765
	DD	3209028611
	DD	2997965172
	DD	1056964608
	DD	1042078039
	DD	3208763504
	DD	2998925687
	DD	1056964608
	DD	1043311911
	DD	3208490745
	DD	2979703788
	DD	1056964608
	DD	1044518635
	DD	3208210498
	DD	847314951
	DD	1056964608
	DD	3197498906
	DD	3207922931
	DD	2991581050
	DD	1065353216
	DD	3196923773
	DD	3207628219
	DD	850275634
	DD	1065353216
	DD	3196363278
	DD	3207326538
	DD	850866486
	DD	1065353216
	DD	3195575871
	DD	3207018070
	DD	839091011
	DD	1065353216
	DD	3194515443
	DD	3206703001
	DD	2988516283
	DD	1065353216
	DD	3193486263
	DD	3206381521
	DD	2995913996
	DD	1065353216
	DD	3192488951
	DD	3206053824
	DD	835167219
	DD	1065353216
	DD	3191524108
	DD	3205720106
	DD	2999832878
	DD	1065353216
	DD	3190592315
	DD	3205380570
	DD	843723495
	DD	1065353216
	DD	3189694133
	DD	3205035419
	DD	851331918
	DD	1065353216
	DD	3188830103
	DD	3204684861
	DD	844865538
	DD	1065353216
	DD	3188000746
	DD	3204209959
	DD	830532777
	DD	1065353216
	DD	3186742084
	DD	3203488490
	DD	838803769
	DD	1065353216
	DD	3185225016
	DD	3202757493
	DD	836355956
	DD	1065353216
	DD	3183780163
	DD	3202017408
	DD	2988316108
	DD	1065353216
	DD	3182408396
	DD	3201268682
	DD	2976529251
	DD	1065353216
	DD	3181110540
	DD	3200511765
	DD	2983580972
	DD	1065353216
	DD	3179887378
	DD	3199747114
	DD	846224294
	DD	1065353216
	DD	3178196862
	DD	3198975188
	DD	841305602
	DD	1065353216
	DD	3176053642
	DD	3198196453
	DD	842959264
	DD	1065353216
	DD	3174063957
	DD	3197411377
	DD	2993510896
	DD	1065353216
	DD	3172229004
	DD	3196620435
	DD	2972482974
	DD	1065353216
	DD	3170205956
	DD	3195588556
	DD	823907357
	DD	1065353216
	DD	3167161428
	DD	3193986067
	DD	2980570358
	DD	1065353216
	DD	3164432432
	DD	3192374722
	DD	820352637
	DD	1065353216
	DD	3161536011
	DD	3190755490
	DD	2970707961
	DD	1065353216
	DD	3157349634
	DD	3189129347
	DD	2984830484
	DD	1065353216
	DD	3153489468
	DD	3187323507
	DD	823486671
	DD	1065353216
	DD	3147680113
	DD	3184049462
	DD	813011701
	DD	1065353216
	DD	3140588184
	DD	3180767493
	DD	827530849
	DD	1065353216
	DD	3130909128
	DD	3175676720
	DD	820978303
	DD	1065353216
	DD	3114133471
	DD	3167292080
	DD	805685656
	DD	1065353216
	DD	0
	DD	0
	DD	0
	DD	1065353216
	DD	3114133471
	DD	1019808432
	DD	2953169304
	DD	1065353216
	DD	3130909128
	DD	1028193072
	DD	2968461951
	DD	1065353216
	DD	3140588184
	DD	1033283845
	DD	2975014497
	DD	1065353216
	DD	3147680113
	DD	1036565814
	DD	2960495349
	DD	1065353216
	DD	3153489468
	DD	1039839859
	DD	2970970319
	DD	1065353216
	DD	3157349634
	DD	1041645699
	DD	837346836
	DD	1065353216
	DD	3161536011
	DD	1043271842
	DD	823224313
	DD	1065353216
	DD	3164432432
	DD	1044891074
	DD	2967836285
	DD	1065353216
	DD	3167161428
	DD	1046502419
	DD	833086710
	DD	1065353216
	DD	3170205956
	DD	1048104908
	DD	2971391005
	DD	1065353216
	DD	3172229004
	DD	1049136787
	DD	824999326
	DD	1065353216
	DD	3174063957
	DD	1049927729
	DD	846027248
	DD	1065353216
	DD	3176053642
	DD	1050712805
	DD	2990442912
	DD	1065353216
	DD	3178196862
	DD	1051491540
	DD	2988789250
	DD	1065353216
	DD	3179887378
	DD	1052263466
	DD	2993707942
	DD	1065353216
	DD	3181110540
	DD	1053028117
	DD	836097324
	DD	1065353216
	DD	3182408396
	DD	1053785034
	DD	829045603
	DD	1065353216
	DD	3183780163
	DD	1054533760
	DD	840832460
	DD	1065353216
	DD	3185225016
	DD	1055273845
	DD	2983839604
	DD	1065353216
	DD	3186742084
	DD	1056004842
	DD	2986287417
	DD	1065353216
	DD	3188000746
	DD	1056726311
	DD	2978016425
	DD	1065353216
	DD	3188830103
	DD	1057201213
	DD	2992349186
	DD	1065353216
	DD	3189694133
	DD	1057551771
	DD	2998815566
	DD	1065353216
	DD	3190592315
	DD	1057896922
	DD	2991207143
	DD	1065353216
	DD	3191524108
	DD	1058236458
	DD	852349230
	DD	1065353216
	DD	3192488951
	DD	1058570176
	DD	2982650867
	DD	1065353216
	DD	3193486263
	DD	1058897873
	DD	848430348
	DD	1065353216
	DD	3194515443
	DD	1059219353
	DD	841032635
	DD	1065353216
	DD	3195575871
	DD	1059534422
	DD	2986574659
	DD	1065353216
	DD	3196363278
	DD	1059842890
	DD	2998350134
	DD	1065353216
	DD	3196923773
	DD	1060144571
	DD	2997759282
	DD	1065353216
	DD	3197498906
	DD	1060439283
	DD	844097402
	DD	1065353216
	DD	1044518635
	DD	1060726850
	DD	2994798599
	DD	1056964608
	DD	1043311911
	DD	1061007097
	DD	832220140
	DD	1056964608
	DD	1042078039
	DD	1061279856
	DD	851442039
	DD	1056964608
	DD	1040817765
	DD	1061544963
	DD	850481524
	DD	1056964608
	DD	1038876298
	DD	1061802258
	DD	848897600
	DD	1056964608
	DD	1036254719
	DD	1062051586
	DD	847147240
	DD	1056964608
	DD	1033584979
	DD	1062292797
	DD	806113028
	DD	1056964608
	DD	1029938589
	DD	1062525745
	DD	848357914
	DD	1056964608
	DD	1024416170
	DD	1062750291
	DD	2994560960
	DD	1056964608
	DD	1013387058
	DD	1062966298
	DD	841166280
	DD	1056964608
	DD	3152590408
	DD	1063173637
	DD	851900755
	DD	1056964608
	DD	3169472868
	DD	1063372184
	DD	3001545765
	DD	1056964608
	DD	3176031322
	DD	1063561817
	DD	823789818
	DD	1056964608
	DD	3180617215
	DD	1063742424
	DD	2998678409
	DD	1056964608
	DD	3183612120
	DD	1063913895
	DD	3001754476
	DD	1056964608
	DD	3186639787
	DD	1064076126
	DD	854796500
	DD	1056964608
	DD	3188684717
	DD	1064229022
	DD	2995991516
	DD	1056964608
	DD	1035072335
	DD	1064372488
	DD	840880349
	DD	1048576000
	DD	1031957395
	DD	1064506439
	DD	851742225
	DD	1048576000
	DD	1025835404
	DD	1064630795
	DD	2996018466
	DD	1048576000
	DD	1015605553
	DD	1064745479
	DD	846006572
	DD	1048576000
	DD	3152414341
	DD	1064850424
	DD	2987244005
	DD	1048576000
	DD	3170705253
	DD	1064945565
	DD	851856985
	DD	1048576000
	DD	3177244920
	DD	1065030846
	DD	855602635
	DD	1048576000
	DD	1027359369
	DD	1065106216
	DD	2989610635
	DD	1040187392
	DD	1018299420
	DD	1065171628
	DD	2969000681
	DD	1040187392
	DD	3140071849
	DD	1065227044
	DD	3002197507
	DD	1040187392
	DD	3168602920
	DD	1065272429
	DD	838093129
	DD	1040187392
	DD	1010124837
	DD	1065307757
	DD	852498564
	DD	1031798784
	DD	3160150850
	DD	1065333007
	DD	836655967
	DD	1031798784
	DD	3151746369
	DD	1065348163
	DD	814009613
	DD	1023410176
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	2147483647
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	1176256512
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	2139095040
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	3190467243
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	1007192156
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	3204448256
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	1026206332
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	255
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	1109588355
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	3167293403
	DD	809222144
	DD	809222144
	DD	809222144
	DD	809222144
	DD	809222144
	DD	809222144
	DD	809222144
	DD	809222144
	DD	809222144
	DD	809222144
	DD	809222144
	DD	809222144
	DD	809222144
	DD	809222144
	DD	809222144
	DD	809222144
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2838781952
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	2710384946
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1073741824
	DD	1413742592
	DD	1074340347
	DD	1413742592
	DD	1074340347
	DD	1413742592
	DD	1074340347
	DD	1413742592
	DD	1074340347
	DD	1413742592
	DD	1074340347
	DD	1413742592
	DD	1074340347
	DD	1413742592
	DD	1074340347
	DD	1413742592
	DD	1074340347
	DD	1280075305
	DD	1033276451
	DD	1280075305
	DD	1033276451
	DD	1280075305
	DD	1033276451
	DD	1280075305
	DD	1033276451
	DD	1280075305
	DD	1033276451
	DD	1280075305
	DD	1033276451
	DD	1280075305
	DD	1033276451
	DD	1280075305
	DD	1033276451
	DD	3162727815
	DD	3217380692
	DD	3162727815
	DD	3217380692
	DD	3162727815
	DD	3217380692
	DD	3162727815
	DD	3217380692
	DD	3162727815
	DD	3217380692
	DD	3162727815
	DD	3217380692
	DD	3162727815
	DD	3217380692
	DD	3162727815
	DD	3217380692
	DD	939838102
	DD	1065423085
	DD	939838102
	DD	1065423085
	DD	939838102
	DD	1065423085
	DD	939838102
	DD	1065423085
	DD	939838102
	DD	1065423085
	DD	939838102
	DD	1065423085
	DD	939838102
	DD	1065423085
	DD	939838102
	DD	1065423085
	DD	4003935331
	DD	3207198463
	DD	4003935331
	DD	3207198463
	DD	4003935331
	DD	3207198463
	DD	4003935331
	DD	3207198463
	DD	4003935331
	DD	3207198463
	DD	4003935331
	DD	3207198463
	DD	4003935331
	DD	3207198463
	DD	4003935331
	DD	3207198463
	DD	239893998
	DD	1053154271
	DD	239893998
	DD	1053154271
	DD	239893998
	DD	1053154271
	DD	239893998
	DD	1053154271
	DD	239893998
	DD	1053154271
	DD	239893998
	DD	1053154271
	DD	239893998
	DD	1053154271
	DD	239893998
	DD	1053154271
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1050868099
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1262485504
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1070141403
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1056964608
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
	DD	1065353216
_2il0floatpacket_21	DD	047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H,047400000H
_2il0floatpacket_22	DD	040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH
_2il0floatpacket_23	DD	040c91000H,040c91000H,040c91000H,040c91000H,040c91000H,040c91000H,040c91000H,040c91000H
_2il0floatpacket_24	DD	0b795777aH,0b795777aH,0b795777aH,0b795777aH,0b795777aH,0b795777aH,0b795777aH,0b795777aH
_2il0floatpacket_25	DD	0fffff000H,0fffff000H,0fffff000H,0fffff000H,0fffff000H,0fffff000H,0fffff000H,0fffff000H
_2il0floatpacket_26	DD	07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH,07fffffffH
_2il0floatpacket_27	DD	035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H,035800000H
_2il0floatpacket_48	DD	07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H,07f800000H
_2il0floatpacket_49	DD	0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH,0007fffffH
_2il0floatpacket_50	DD	000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H,000800000H
_2il0floatpacket_51	DD	00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH,00000ffffH
_2il0floatpacket_52	DD	080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H,080000000H
_2il0floatpacket_53	DD	03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H,03f800000H
_2il0floatpacket_54	DD	028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H,028800000H
_2il0floatpacket_55	DD	00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH,00003ffffH
_2il0floatpacket_56	DD	034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H,034000000H
_2il0floatpacket_57	DD	0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH,0000001ffH
_2il0floatpacket_58	DD	0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH
_2il0floatpacket_59	DD	0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH,0000000ffH
_2il0floatpacket_28	DD	0ffffffffH,000000000H,0ffffffffH,000000000H
_2il0floatpacket_29	DD	07f800000H,07f800000H,07f800000H,07f800000H
_2il0floatpacket_30	DD	0007fffffH,0007fffffH,0007fffffH,0007fffffH
_2il0floatpacket_31	DD	000800000H,000800000H,000800000H,000800000H
_2il0floatpacket_32	DD	00000ffffH,00000ffffH,00000ffffH,00000ffffH
_2il0floatpacket_33	DD	080000000H,080000000H,080000000H,080000000H
_2il0floatpacket_34	DD	03f800000H,03f800000H,03f800000H,03f800000H
_2il0floatpacket_35	DD	047400000H,047400000H,047400000H,047400000H
_2il0floatpacket_36	DD	028800000H,028800000H,028800000H,028800000H
_2il0floatpacket_37	DD	00003ffffH,00003ffffH,00003ffffH,00003ffffH
_2il0floatpacket_38	DD	034000000H,034000000H,034000000H,034000000H
_2il0floatpacket_39	DD	0000001ffH,0000001ffH,0000001ffH,0000001ffH
_2il0floatpacket_40	DD	040c90fdbH,040c90fdbH,040c90fdbH,040c90fdbH
_2il0floatpacket_41	DD	0b43bbd2eH,0b43bbd2eH,0b43bbd2eH,0b43bbd2eH
_2il0floatpacket_42	DD	07fffffffH,07fffffffH,07fffffffH,07fffffffH
_2il0floatpacket_43	DD	035800000H,035800000H,035800000H,035800000H
_2il0floatpacket_44	DD	0000000ffH,0000000ffH,0000000ffH,0000000ffH
_2il0floatpacket_45	DD	040c91000H,040c91000H,040c91000H,040c91000H
_2il0floatpacket_46	DD	0b795777aH,0b795777aH,0b795777aH,0b795777aH
_2il0floatpacket_47	DD	0fffff000H,0fffff000H,0fffff000H,0fffff000H
_vmlsCosHATab	DD	0
	DD	2139095040
	DD	0
	DD	0
_RDATA	ENDS
_DATA	SEGMENT      'DATA'
_DATA	ENDS
EXTRN	__ImageBase:PROC
EXTRN	_fltused:BYTE
ENDIF
	END
