
ex18:     file format elf64-x86-64


Disassembly of section .init:

00000000004005c8 <_init>:
  4005c8:	48 83 ec 08          	sub    $0x8,%rsp
  4005cc:	48 8b 05 25 1a 20 00 	mov    0x201a25(%rip),%rax        # 601ff8 <_DYNAMIC+0x1d0>
  4005d3:	48 85 c0             	test   %rax,%rax
  4005d6:	74 05                	je     4005dd <_init+0x15>
  4005d8:	e8 73 00 00 00       	callq  400650 <__gmon_start__@plt>
  4005dd:	48 83 c4 08          	add    $0x8,%rsp
  4005e1:	c3                   	retq   

Disassembly of section .plt:

00000000004005f0 <free@plt-0x10>:
  4005f0:	ff 35 12 1a 20 00    	pushq  0x201a12(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4005f6:	ff 25 14 1a 20 00    	jmpq   *0x201a14(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4005fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400600 <free@plt>:
  400600:	ff 25 12 1a 20 00    	jmpq   *0x201a12(%rip)        # 602018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400606:	68 00 00 00 00       	pushq  $0x0
  40060b:	e9 e0 ff ff ff       	jmpq   4005f0 <_init+0x28>

0000000000400610 <putchar@plt>:
  400610:	ff 25 0a 1a 20 00    	jmpq   *0x201a0a(%rip)        # 602020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400616:	68 01 00 00 00       	pushq  $0x1
  40061b:	e9 d0 ff ff ff       	jmpq   4005f0 <_init+0x28>

0000000000400620 <__errno_location@plt>:
  400620:	ff 25 02 1a 20 00    	jmpq   *0x201a02(%rip)        # 602028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400626:	68 02 00 00 00       	pushq  $0x2
  40062b:	e9 c0 ff ff ff       	jmpq   4005f0 <_init+0x28>

0000000000400630 <printf@plt>:
  400630:	ff 25 fa 19 20 00    	jmpq   *0x2019fa(%rip)        # 602030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400636:	68 03 00 00 00       	pushq  $0x3
  40063b:	e9 b0 ff ff ff       	jmpq   4005f0 <_init+0x28>

0000000000400640 <__libc_start_main@plt>:
  400640:	ff 25 f2 19 20 00    	jmpq   *0x2019f2(%rip)        # 602038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400646:	68 04 00 00 00       	pushq  $0x4
  40064b:	e9 a0 ff ff ff       	jmpq   4005f0 <_init+0x28>

0000000000400650 <__gmon_start__@plt>:
  400650:	ff 25 ea 19 20 00    	jmpq   *0x2019ea(%rip)        # 602040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400656:	68 05 00 00 00       	pushq  $0x5
  40065b:	e9 90 ff ff ff       	jmpq   4005f0 <_init+0x28>

0000000000400660 <memcpy@plt>:
  400660:	ff 25 e2 19 20 00    	jmpq   *0x2019e2(%rip)        # 602048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400666:	68 06 00 00 00       	pushq  $0x6
  40066b:	e9 80 ff ff ff       	jmpq   4005f0 <_init+0x28>

0000000000400670 <malloc@plt>:
  400670:	ff 25 da 19 20 00    	jmpq   *0x2019da(%rip)        # 602050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400676:	68 07 00 00 00       	pushq  $0x7
  40067b:	e9 70 ff ff ff       	jmpq   4005f0 <_init+0x28>

0000000000400680 <perror@plt>:
  400680:	ff 25 d2 19 20 00    	jmpq   *0x2019d2(%rip)        # 602058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400686:	68 08 00 00 00       	pushq  $0x8
  40068b:	e9 60 ff ff ff       	jmpq   4005f0 <_init+0x28>

0000000000400690 <atoi@plt>:
  400690:	ff 25 ca 19 20 00    	jmpq   *0x2019ca(%rip)        # 602060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400696:	68 09 00 00 00       	pushq  $0x9
  40069b:	e9 50 ff ff ff       	jmpq   4005f0 <_init+0x28>

00000000004006a0 <exit@plt>:
  4006a0:	ff 25 c2 19 20 00    	jmpq   *0x2019c2(%rip)        # 602068 <_GLOBAL_OFFSET_TABLE_+0x68>
  4006a6:	68 0a 00 00 00       	pushq  $0xa
  4006ab:	e9 40 ff ff ff       	jmpq   4005f0 <_init+0x28>

Disassembly of section .text:

00000000004006b0 <_start>:
  4006b0:	31 ed                	xor    %ebp,%ebp
  4006b2:	49 89 d1             	mov    %rdx,%r9
  4006b5:	5e                   	pop    %rsi
  4006b6:	48 89 e2             	mov    %rsp,%rdx
  4006b9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4006bd:	50                   	push   %rax
  4006be:	54                   	push   %rsp
  4006bf:	49 c7 c0 d0 0b 40 00 	mov    $0x400bd0,%r8
  4006c6:	48 c7 c1 60 0b 40 00 	mov    $0x400b60,%rcx
  4006cd:	48 c7 c7 55 0a 40 00 	mov    $0x400a55,%rdi
  4006d4:	e8 67 ff ff ff       	callq  400640 <__libc_start_main@plt>
  4006d9:	f4                   	hlt    
  4006da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004006e0 <deregister_tm_clones>:
  4006e0:	b8 87 20 60 00       	mov    $0x602087,%eax
  4006e5:	55                   	push   %rbp
  4006e6:	48 2d 80 20 60 00    	sub    $0x602080,%rax
  4006ec:	48 83 f8 0e          	cmp    $0xe,%rax
  4006f0:	48 89 e5             	mov    %rsp,%rbp
  4006f3:	77 02                	ja     4006f7 <deregister_tm_clones+0x17>
  4006f5:	5d                   	pop    %rbp
  4006f6:	c3                   	retq   
  4006f7:	b8 00 00 00 00       	mov    $0x0,%eax
  4006fc:	48 85 c0             	test   %rax,%rax
  4006ff:	74 f4                	je     4006f5 <deregister_tm_clones+0x15>
  400701:	5d                   	pop    %rbp
  400702:	bf 80 20 60 00       	mov    $0x602080,%edi
  400707:	ff e0                	jmpq   *%rax
  400709:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400710 <register_tm_clones>:
  400710:	b8 80 20 60 00       	mov    $0x602080,%eax
  400715:	55                   	push   %rbp
  400716:	48 2d 80 20 60 00    	sub    $0x602080,%rax
  40071c:	48 c1 f8 03          	sar    $0x3,%rax
  400720:	48 89 e5             	mov    %rsp,%rbp
  400723:	48 89 c2             	mov    %rax,%rdx
  400726:	48 c1 ea 3f          	shr    $0x3f,%rdx
  40072a:	48 01 d0             	add    %rdx,%rax
  40072d:	48 d1 f8             	sar    %rax
  400730:	75 02                	jne    400734 <register_tm_clones+0x24>
  400732:	5d                   	pop    %rbp
  400733:	c3                   	retq   
  400734:	ba 00 00 00 00       	mov    $0x0,%edx
  400739:	48 85 d2             	test   %rdx,%rdx
  40073c:	74 f4                	je     400732 <register_tm_clones+0x22>
  40073e:	5d                   	pop    %rbp
  40073f:	48 89 c6             	mov    %rax,%rsi
  400742:	bf 80 20 60 00       	mov    $0x602080,%edi
  400747:	ff e2                	jmpq   *%rdx
  400749:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400750 <__do_global_dtors_aux>:
  400750:	80 3d 29 19 20 00 00 	cmpb   $0x0,0x201929(%rip)        # 602080 <__TMC_END__>
  400757:	75 11                	jne    40076a <__do_global_dtors_aux+0x1a>
  400759:	55                   	push   %rbp
  40075a:	48 89 e5             	mov    %rsp,%rbp
  40075d:	e8 7e ff ff ff       	callq  4006e0 <deregister_tm_clones>
  400762:	5d                   	pop    %rbp
  400763:	c6 05 16 19 20 00 01 	movb   $0x1,0x201916(%rip)        # 602080 <__TMC_END__>
  40076a:	f3 c3                	repz retq 
  40076c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400770 <frame_dummy>:
  400770:	48 83 3d a8 16 20 00 	cmpq   $0x0,0x2016a8(%rip)        # 601e20 <__JCR_END__>
  400777:	00 
  400778:	74 1e                	je     400798 <frame_dummy+0x28>
  40077a:	b8 00 00 00 00       	mov    $0x0,%eax
  40077f:	48 85 c0             	test   %rax,%rax
  400782:	74 14                	je     400798 <frame_dummy+0x28>
  400784:	55                   	push   %rbp
  400785:	bf 20 1e 60 00       	mov    $0x601e20,%edi
  40078a:	48 89 e5             	mov    %rsp,%rbp
  40078d:	ff d0                	callq  *%rax
  40078f:	5d                   	pop    %rbp
  400790:	e9 7b ff ff ff       	jmpq   400710 <register_tm_clones>
  400795:	0f 1f 00             	nopl   (%rax)
  400798:	e9 73 ff ff ff       	jmpq   400710 <register_tm_clones>

000000000040079d <die>:
  40079d:	55                   	push   %rbp
  40079e:	48 89 e5             	mov    %rsp,%rbp
  4007a1:	48 83 ec 10          	sub    $0x10,%rsp
  4007a5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4007a9:	e8 72 fe ff ff       	callq  400620 <__errno_location@plt>
  4007ae:	8b 00                	mov    (%rax),%eax
  4007b0:	85 c0                	test   %eax,%eax
  4007b2:	74 0e                	je     4007c2 <die+0x25>
  4007b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4007b8:	48 89 c7             	mov    %rax,%rdi
  4007bb:	e8 c0 fe ff ff       	callq  400680 <perror@plt>
  4007c0:	eb 16                	jmp    4007d8 <die+0x3b>
  4007c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4007c6:	48 89 c6             	mov    %rax,%rsi
  4007c9:	bf e4 0b 40 00       	mov    $0x400be4,%edi
  4007ce:	b8 00 00 00 00       	mov    $0x0,%eax
  4007d3:	e8 58 fe ff ff       	callq  400630 <printf@plt>
  4007d8:	bf 01 00 00 00       	mov    $0x1,%edi
  4007dd:	e8 be fe ff ff       	callq  4006a0 <exit@plt>

00000000004007e2 <bubble_sort>:
  4007e2:	55                   	push   %rbp
  4007e3:	48 89 e5             	mov    %rsp,%rbp
  4007e6:	48 83 ec 40          	sub    $0x40,%rsp
  4007ea:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  4007ee:	89 75 d4             	mov    %esi,-0x2c(%rbp)
  4007f1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  4007f5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  4007fc:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  4007ff:	48 98                	cltq   
  400801:	48 c1 e0 02          	shl    $0x2,%rax
  400805:	48 89 c7             	mov    %rax,%rdi
  400808:	e8 63 fe ff ff       	callq  400670 <malloc@plt>
  40080d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  400811:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  400816:	75 0a                	jne    400822 <bubble_sort+0x40>
  400818:	bf ef 0b 40 00       	mov    $0x400bef,%edi
  40081d:	e8 7b ff ff ff       	callq  40079d <die>
  400822:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  400825:	48 98                	cltq   
  400827:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  40082e:	00 
  40082f:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  400833:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400837:	48 89 ce             	mov    %rcx,%rsi
  40083a:	48 89 c7             	mov    %rax,%rdi
  40083d:	e8 1e fe ff ff       	callq  400660 <memcpy@plt>
  400842:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  400849:	e9 c7 00 00 00       	jmpq   400915 <bubble_sort+0x133>
  40084e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  400855:	e9 a8 00 00 00       	jmpq   400902 <bubble_sort+0x120>
  40085a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  40085d:	48 98                	cltq   
  40085f:	48 83 c0 01          	add    $0x1,%rax
  400863:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  40086a:	00 
  40086b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40086f:	48 01 d0             	add    %rdx,%rax
  400872:	8b 08                	mov    (%rax),%ecx
  400874:	8b 45 f0             	mov    -0x10(%rbp),%eax
  400877:	48 98                	cltq   
  400879:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  400880:	00 
  400881:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400885:	48 01 d0             	add    %rdx,%rax
  400888:	8b 10                	mov    (%rax),%edx
  40088a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  40088e:	89 ce                	mov    %ecx,%esi
  400890:	89 d7                	mov    %edx,%edi
  400892:	ff d0                	callq  *%rax
  400894:	85 c0                	test   %eax,%eax
  400896:	7e 66                	jle    4008fe <bubble_sort+0x11c>
  400898:	8b 45 f0             	mov    -0x10(%rbp),%eax
  40089b:	48 98                	cltq   
  40089d:	48 83 c0 01          	add    $0x1,%rax
  4008a1:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  4008a8:	00 
  4008a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4008ad:	48 01 d0             	add    %rdx,%rax
  4008b0:	8b 00                	mov    (%rax),%eax
  4008b2:	89 45 f4             	mov    %eax,-0xc(%rbp)
  4008b5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  4008b8:	48 98                	cltq   
  4008ba:	48 83 c0 01          	add    $0x1,%rax
  4008be:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  4008c5:	00 
  4008c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4008ca:	48 01 c2             	add    %rax,%rdx
  4008cd:	8b 45 f0             	mov    -0x10(%rbp),%eax
  4008d0:	48 98                	cltq   
  4008d2:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
  4008d9:	00 
  4008da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4008de:	48 01 c8             	add    %rcx,%rax
  4008e1:	8b 00                	mov    (%rax),%eax
  4008e3:	89 02                	mov    %eax,(%rdx)
  4008e5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  4008e8:	48 98                	cltq   
  4008ea:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  4008f1:	00 
  4008f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4008f6:	48 01 c2             	add    %rax,%rdx
  4008f9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  4008fc:	89 02                	mov    %eax,(%rdx)
  4008fe:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  400902:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  400905:	83 e8 01             	sub    $0x1,%eax
  400908:	3b 45 f0             	cmp    -0x10(%rbp),%eax
  40090b:	0f 8f 49 ff ff ff    	jg     40085a <bubble_sort+0x78>
  400911:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  400915:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400918:	3b 45 d4             	cmp    -0x2c(%rbp),%eax
  40091b:	0f 8c 2d ff ff ff    	jl     40084e <bubble_sort+0x6c>
  400921:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400925:	c9                   	leaveq 
  400926:	c3                   	retq   

0000000000400927 <reverse_order>:
  400927:	55                   	push   %rbp
  400928:	48 89 e5             	mov    %rsp,%rbp
  40092b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40092e:	89 75 f8             	mov    %esi,-0x8(%rbp)
  400931:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400934:	8b 55 f8             	mov    -0x8(%rbp),%edx
  400937:	29 c2                	sub    %eax,%edx
  400939:	89 d0                	mov    %edx,%eax
  40093b:	5d                   	pop    %rbp
  40093c:	c3                   	retq   

000000000040093d <sorted_order>:
  40093d:	55                   	push   %rbp
  40093e:	48 89 e5             	mov    %rsp,%rbp
  400941:	89 7d fc             	mov    %edi,-0x4(%rbp)
  400944:	89 75 f8             	mov    %esi,-0x8(%rbp)
  400947:	8b 45 f8             	mov    -0x8(%rbp),%eax
  40094a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  40094d:	29 c2                	sub    %eax,%edx
  40094f:	89 d0                	mov    %edx,%eax
  400951:	5d                   	pop    %rbp
  400952:	c3                   	retq   

0000000000400953 <strange_order>:
  400953:	55                   	push   %rbp
  400954:	48 89 e5             	mov    %rsp,%rbp
  400957:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40095a:	89 75 f8             	mov    %esi,-0x8(%rbp)
  40095d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  400961:	74 06                	je     400969 <strange_order+0x16>
  400963:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  400967:	75 07                	jne    400970 <strange_order+0x1d>
  400969:	b8 00 00 00 00       	mov    $0x0,%eax
  40096e:	eb 09                	jmp    400979 <strange_order+0x26>
  400970:	8b 45 fc             	mov    -0x4(%rbp),%eax
  400973:	99                   	cltd   
  400974:	f7 7d f8             	idivl  -0x8(%rbp)
  400977:	89 d0                	mov    %edx,%eax
  400979:	5d                   	pop    %rbp
  40097a:	c3                   	retq   

000000000040097b <test_sorting>:
  40097b:	55                   	push   %rbp
  40097c:	48 89 e5             	mov    %rsp,%rbp
  40097f:	48 83 ec 40          	sub    $0x40,%rsp
  400983:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  400987:	89 75 d4             	mov    %esi,-0x2c(%rbp)
  40098a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  40098e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  400992:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  400995:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400999:	89 ce                	mov    %ecx,%esi
  40099b:	48 89 c7             	mov    %rax,%rdi
  40099e:	e8 3f fe ff ff       	callq  4007e2 <bubble_sort>
  4009a3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  4009a7:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  4009ac:	75 0a                	jne    4009b8 <test_sorting+0x3d>
  4009ae:	bf f9 0b 40 00       	mov    $0x400bf9,%edi
  4009b3:	e8 e5 fd ff ff       	callq  40079d <die>
  4009b8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  4009bf:	eb 2b                	jmp    4009ec <test_sorting+0x71>
  4009c1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  4009c4:	48 98                	cltq   
  4009c6:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  4009cd:	00 
  4009ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  4009d2:	48 01 d0             	add    %rdx,%rax
  4009d5:	8b 00                	mov    (%rax),%eax
  4009d7:	89 c6                	mov    %eax,%esi
  4009d9:	bf 08 0c 40 00       	mov    $0x400c08,%edi
  4009de:	b8 00 00 00 00       	mov    $0x0,%eax
  4009e3:	e8 48 fc ff ff       	callq  400630 <printf@plt>
  4009e8:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  4009ec:	8b 45 ec             	mov    -0x14(%rbp),%eax
  4009ef:	3b 45 d4             	cmp    -0x2c(%rbp),%eax
  4009f2:	7c cd                	jl     4009c1 <test_sorting+0x46>
  4009f4:	bf 0a 00 00 00       	mov    $0xa,%edi
  4009f9:	e8 12 fc ff ff       	callq  400610 <putchar@plt>
  4009fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  400a02:	48 89 c7             	mov    %rax,%rdi
  400a05:	e8 f6 fb ff ff       	callq  400600 <free@plt>
  400a0a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  400a0e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  400a12:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  400a19:	eb 28                	jmp    400a43 <test_sorting+0xc8>
  400a1b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400a1e:	48 63 d0             	movslq %eax,%rdx
  400a21:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400a25:	48 01 d0             	add    %rdx,%rax
  400a28:	0f b6 00             	movzbl (%rax),%eax
  400a2b:	0f b6 c0             	movzbl %al,%eax
  400a2e:	89 c6                	mov    %eax,%esi
  400a30:	bf 0c 0c 40 00       	mov    $0x400c0c,%edi
  400a35:	b8 00 00 00 00       	mov    $0x0,%eax
  400a3a:	e8 f1 fb ff ff       	callq  400630 <printf@plt>
  400a3f:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  400a43:	83 7d ec 18          	cmpl   $0x18,-0x14(%rbp)
  400a47:	7e d2                	jle    400a1b <test_sorting+0xa0>
  400a49:	bf 0a 00 00 00       	mov    $0xa,%edi
  400a4e:	e8 bd fb ff ff       	callq  400610 <putchar@plt>
  400a53:	c9                   	leaveq 
  400a54:	c3                   	retq   

0000000000400a55 <main>:
  400a55:	55                   	push   %rbp
  400a56:	48 89 e5             	mov    %rsp,%rbp
  400a59:	53                   	push   %rbx
  400a5a:	48 83 ec 38          	sub    $0x38,%rsp
  400a5e:	89 7d cc             	mov    %edi,-0x34(%rbp)
  400a61:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  400a65:	83 7d cc 01          	cmpl   $0x1,-0x34(%rbp)
  400a69:	7f 0a                	jg     400a75 <main+0x20>
  400a6b:	bf 12 0c 40 00       	mov    $0x400c12,%edi
  400a70:	e8 28 fd ff ff       	callq  40079d <die>
  400a75:	8b 45 cc             	mov    -0x34(%rbp),%eax
  400a78:	83 e8 01             	sub    $0x1,%eax
  400a7b:	89 45 dc             	mov    %eax,-0x24(%rbp)
  400a7e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  400a85:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  400a89:	48 83 c0 08          	add    $0x8,%rax
  400a8d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  400a91:	8b 45 dc             	mov    -0x24(%rbp),%eax
  400a94:	48 98                	cltq   
  400a96:	48 c1 e0 02          	shl    $0x2,%rax
  400a9a:	48 89 c7             	mov    %rax,%rdi
  400a9d:	e8 ce fb ff ff       	callq  400670 <malloc@plt>
  400aa2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  400aa6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  400aab:	75 0a                	jne    400ab7 <main+0x62>
  400aad:	bf 28 0c 40 00       	mov    $0x400c28,%edi
  400ab2:	e8 e6 fc ff ff       	callq  40079d <die>
  400ab7:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  400abe:	eb 3a                	jmp    400afa <main+0xa5>
  400ac0:	8b 45 d8             	mov    -0x28(%rbp),%eax
  400ac3:	48 98                	cltq   
  400ac5:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  400acc:	00 
  400acd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400ad1:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
  400ad5:	8b 45 d8             	mov    -0x28(%rbp),%eax
  400ad8:	48 98                	cltq   
  400ada:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  400ae1:	00 
  400ae2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  400ae6:	48 01 d0             	add    %rdx,%rax
  400ae9:	48 8b 00             	mov    (%rax),%rax
  400aec:	48 89 c7             	mov    %rax,%rdi
  400aef:	e8 9c fb ff ff       	callq  400690 <atoi@plt>
  400af4:	89 03                	mov    %eax,(%rbx)
  400af6:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
  400afa:	8b 45 d8             	mov    -0x28(%rbp),%eax
  400afd:	3b 45 dc             	cmp    -0x24(%rbp),%eax
  400b00:	7c be                	jl     400ac0 <main+0x6b>
  400b02:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  400b05:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400b09:	ba 3d 09 40 00       	mov    $0x40093d,%edx
  400b0e:	89 ce                	mov    %ecx,%esi
  400b10:	48 89 c7             	mov    %rax,%rdi
  400b13:	e8 63 fe ff ff       	callq  40097b <test_sorting>
  400b18:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  400b1b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400b1f:	ba 27 09 40 00       	mov    $0x400927,%edx
  400b24:	89 ce                	mov    %ecx,%esi
  400b26:	48 89 c7             	mov    %rax,%rdi
  400b29:	e8 4d fe ff ff       	callq  40097b <test_sorting>
  400b2e:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  400b31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400b35:	ba 53 09 40 00       	mov    $0x400953,%edx
  400b3a:	89 ce                	mov    %ecx,%esi
  400b3c:	48 89 c7             	mov    %rax,%rdi
  400b3f:	e8 37 fe ff ff       	callq  40097b <test_sorting>
  400b44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400b48:	48 89 c7             	mov    %rax,%rdi
  400b4b:	e8 b0 fa ff ff       	callq  400600 <free@plt>
  400b50:	b8 00 00 00 00       	mov    $0x0,%eax
  400b55:	48 83 c4 38          	add    $0x38,%rsp
  400b59:	5b                   	pop    %rbx
  400b5a:	5d                   	pop    %rbp
  400b5b:	c3                   	retq   
  400b5c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400b60 <__libc_csu_init>:
  400b60:	41 57                	push   %r15
  400b62:	41 89 ff             	mov    %edi,%r15d
  400b65:	41 56                	push   %r14
  400b67:	49 89 f6             	mov    %rsi,%r14
  400b6a:	41 55                	push   %r13
  400b6c:	49 89 d5             	mov    %rdx,%r13
  400b6f:	41 54                	push   %r12
  400b71:	4c 8d 25 98 12 20 00 	lea    0x201298(%rip),%r12        # 601e10 <__frame_dummy_init_array_entry>
  400b78:	55                   	push   %rbp
  400b79:	48 8d 2d 98 12 20 00 	lea    0x201298(%rip),%rbp        # 601e18 <__init_array_end>
  400b80:	53                   	push   %rbx
  400b81:	4c 29 e5             	sub    %r12,%rbp
  400b84:	31 db                	xor    %ebx,%ebx
  400b86:	48 c1 fd 03          	sar    $0x3,%rbp
  400b8a:	48 83 ec 08          	sub    $0x8,%rsp
  400b8e:	e8 35 fa ff ff       	callq  4005c8 <_init>
  400b93:	48 85 ed             	test   %rbp,%rbp
  400b96:	74 1e                	je     400bb6 <__libc_csu_init+0x56>
  400b98:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  400b9f:	00 
  400ba0:	4c 89 ea             	mov    %r13,%rdx
  400ba3:	4c 89 f6             	mov    %r14,%rsi
  400ba6:	44 89 ff             	mov    %r15d,%edi
  400ba9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  400bad:	48 83 c3 01          	add    $0x1,%rbx
  400bb1:	48 39 eb             	cmp    %rbp,%rbx
  400bb4:	75 ea                	jne    400ba0 <__libc_csu_init+0x40>
  400bb6:	48 83 c4 08          	add    $0x8,%rsp
  400bba:	5b                   	pop    %rbx
  400bbb:	5d                   	pop    %rbp
  400bbc:	41 5c                	pop    %r12
  400bbe:	41 5d                	pop    %r13
  400bc0:	41 5e                	pop    %r14
  400bc2:	41 5f                	pop    %r15
  400bc4:	c3                   	retq   
  400bc5:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
  400bcc:	00 00 00 00 

0000000000400bd0 <__libc_csu_fini>:
  400bd0:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000400bd4 <_fini>:
  400bd4:	48 83 ec 08          	sub    $0x8,%rsp
  400bd8:	48 83 c4 08          	add    $0x8,%rsp
  400bdc:	c3                   	retq   
