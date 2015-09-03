
set(STORMLIB_FILES
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/adpcm/adpcm.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/huffman/huff.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/jenkins/lookup3.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/lzma/C/LzFind.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/lzma/C/LzmaDec.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/lzma/C/LzmaEnc.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/pklib/explode.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/pklib/implode.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/sparse/sparse.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/FileStream.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SBaseCommon.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SBaseDumpData.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SBaseFileTable.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SBaseSubTypes.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SCompression.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SFileAddFile.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SFileAttributes.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SFileCompactArchive.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SFileCreateArchive.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SFileExtractFile.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SFileFindFile.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SFileGetFileInfo.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SFileListFile.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SFileOpenArchive.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SFileOpenFileEx.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SFilePatchArchives.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SFileReadFile.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/SFileVerify.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/rsa/rsa_verify_simple.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/misc/crypt_libc.c
)

set(TOMCRYPT_FILES
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/hashes/hash_memory.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/hashes/md5.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/hashes/sha1.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/math/ltm_desc.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/math/multi.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/math/rand_prime.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/misc/base64_decode.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/misc/crypt_argchk.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/misc/crypt_find_hash.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/misc/crypt_find_prng.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/misc/crypt_hash_descriptor.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/misc/crypt_hash_is_valid.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/misc/crypt_ltc_mp_descriptor.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/misc/crypt_prng_descriptor.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/misc/crypt_prng_is_valid.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/misc/crypt_register_hash.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/misc/crypt_register_prng.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/misc/zeromem.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_bit_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_boolean.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_choice.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_ia5_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_integer.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_object_identifier.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_octet_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_printable_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_sequence_ex.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_sequence_flexi.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_sequence_multi.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_short_integer.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_utctime.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_decode_utf8_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_bit_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_boolean.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_ia5_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_integer.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_object_identifier.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_octet_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_printable_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_sequence_ex.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_sequence_multi.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_set.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_setof.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_short_integer.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_utctime.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_encode_utf8_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_length_bit_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_length_boolean.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_length_ia5_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_length_integer.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_length_object_identifier.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_length_octet_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_length_printable_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_length_sequence.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_length_utctime.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_sequence_free.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_length_utf8_string.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/asn1/der_length_short_integer.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/ecc/ltc_ecc_map.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/ecc/ltc_ecc_mul2add.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/ecc/ltc_ecc_mulmod.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/ecc/ltc_ecc_points.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/ecc/ltc_ecc_projective_add_point.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/ecc/ltc_ecc_projective_dbl_point.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/pkcs1/pkcs_1_mgf1.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/pkcs1/pkcs_1_oaep_decode.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/pkcs1/pkcs_1_pss_decode.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/pkcs1/pkcs_1_pss_encode.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/pkcs1/pkcs_1_v1_5_decode.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/pkcs1/pkcs_1_v1_5_encode.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/rsa/rsa_exptmod.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/rsa/rsa_free.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/rsa/rsa_import.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/rsa/rsa_make_key.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/rsa/rsa_sign_hash.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtomcrypt/src/pk/rsa/rsa_verify_hash.c
)

set(TOMMATH_FILES
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bncore.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_fast_mp_invmod.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_fast_mp_montgomery_reduce.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_fast_s_mp_mul_digs.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_fast_s_mp_mul_high_digs.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_fast_s_mp_sqr.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_2expt.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_abs.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_add.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_addmod.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_add_d.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_and.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_clamp.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_clear.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_clear_multi.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_cmp.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_cmp_d.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_cmp_mag.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_cnt_lsb.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_copy.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_count_bits.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_div.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_div_2.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_div_2d.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_div_3.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_div_d.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_dr_is_modulus.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_dr_reduce.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_dr_setup.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_exch.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_exptmod.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_exptmod_fast.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_expt_d.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_exteuclid.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_fread.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_fwrite.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_gcd.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_get_int.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_grow.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_init.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_init_copy.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_init_multi.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_init_set.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_init_set_int.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_init_size.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_invmod.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_invmod_slow.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_is_square.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_jacobi.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_karatsuba_mul.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_karatsuba_sqr.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_lcm.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_lshd.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_mod.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_mod_2d.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_mod_d.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_montgomery_calc_normalization.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_montgomery_reduce.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_montgomery_setup.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_mul.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_mulmod.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_mul_2.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_mul_2d.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_mul_d.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_neg.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_n_root.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_or.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_prime_fermat.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_prime_is_divisible.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_prime_is_prime.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_prime_miller_rabin.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_prime_next_prime.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_prime_rabin_miller_trials.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_prime_random_ex.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_radix_size.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_radix_smap.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_rand.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_read_radix.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_read_signed_bin.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_read_unsigned_bin.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_reduce.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_reduce_2k.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_reduce_2k_l.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_reduce_2k_setup.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_reduce_2k_setup_l.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_reduce_is_2k.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_reduce_is_2k_l.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_reduce_setup.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_rshd.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_set.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_set_int.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_shrink.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_signed_bin_size.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_sqr.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_sqrmod.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_sqrt.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_sub.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_submod.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_sub_d.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_toom_mul.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_toom_sqr.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_toradix.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_toradix_n.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_to_signed_bin.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_to_signed_bin_n.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_to_unsigned_bin.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_to_unsigned_bin_n.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_unsigned_bin_size.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_xor.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_mp_zero.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_prime_tab.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_reverse.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_s_mp_add.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_s_mp_exptmod.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_s_mp_mul_digs.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_s_mp_mul_high_digs.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_s_mp_sqr.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/libtommath/bn_s_mp_sub.c
)

set(ZLIB_BZIP2_FILES
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/bzip2/blocksort.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/bzip2/bzlib.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/bzip2/compress.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/bzip2/crctable.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/bzip2/decompress.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/bzip2/huffman.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/bzip2/randtable.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/zlib/adler32.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/zlib/compress.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/zlib/crc32.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/zlib/deflate.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/zlib/inffast.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/zlib/inflate.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/zlib/inftrees.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/zlib/trees.c
  ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/zlib/zutil.c
)

file(GLOB_RECURSE clientmanager_Sources *.cpp *.h)

include_directories(
  ${CMAKE_BINARY_DIR}
  ${CMAKE_SOURCE_DIR}/dep/cppformat
  ${CMAKE_SOURCE_DIR}/src/common/
  ${CMAKE_SOURCE_DIR}/src/common/Configuration
  ${CMAKE_SOURCE_DIR}/src/common/Logging
  ${CMAKE_SOURCE_DIR}/src/common/Threading
  ${CMAKE_SOURCE_DIR}/src/common/Utilities
  ${CMAKE_SOURCE_DIR}/src/server/database/Database
  ${CMAKE_SOURCE_DIR}/src/server/shared
  ${CMAKE_SOURCE_DIR}/src/server/shared/Cryptography
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${OPENSSL_INCLUDE_DIR}
  ${MYSQL_INCLUDE_DIR}
)

GroupSources(${CMAKE_CURRENT_SOURCE_DIR})

# clientmanager

set(clientmanager_C_FLAGS "-D_7ZIP_ST -DBZ_STRICT_ANSI")

if(WIN32)
    if(MSVC)
        set(clientmanager_C_FLAGS "-D_7ZIP_ST -DWIN32")
    endif()
    set(clientmanager_SRC_ADDITIONAL_FILES ${ZLIB_BZIP2_FILES} ${TOMCRYPT_FILES} ${TOMMATH_FILES})
endif()

if(APPLE)
    set(clientmanager_LINK_FLAGS "-lz -lbz2 -framework Carbon")
    set(clientmanager_PUBLIC_HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/StormLib.h ${CMAKE_CURRENT_SOURCE_DIR}/StormLib/StormPort.h)
endif()

if (${CMAKE_SYSTEM_NAME} STREQUAL Linux)
    set(clientmanager_LINK_FLAGS "-lz -lbz2")
endif()

add_executable(clientmanager ${STORMLIB_FILES} ${ZLIB_BZIP2_FILES} ${TOMCRYPT_FILES} ${TOMMATH_FILES} ${clientmanager_Sources})

if(APPLE)
	set_target_properties(clientmanager PROPERTIES COMPILE_FLAGS "${clientmanager_C_FLAGS}" LINK_FLAGS "${clientmanager_LINK_FLAGS}" PUBLIC_HEADER "${PUBLIC_HEADERS}")
else()
	set_target_properties(clientmanager PROPERTIES COMPILE_FLAGS "${clientmanager_C_FLAGS}" LINK_FLAGS "${clientmanager_LINK_FLAGS}")
endif()

# add_executable(clientmanager ${StormLib_SRCS} ${ZLIB_BZIP2_FILES} ${clientmanager_Sources})

target_link_libraries(clientmanager
  common
  shared
  database
  format
  ${MYSQL_LIBRARY}
  ${OPENSSL_LIBRARIES}
  ${Boost_LIBRARIES}
)

if( WIN32 )
  if ( MSVC )
    add_custom_command(TARGET clientmanager
      POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/clientmanager.conf.dist ${CMAKE_BINARY_DIR}/bin/$(ConfigurationName)/
    )
  elseif ( MINGW )
    add_custom_command(TARGET clientmanager
      POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/clientmanager.conf.dist ${CMAKE_BINARY_DIR}/bin/
    )
  endif()
endif()

if( UNIX )
  install(TARGETS clientmanager DESTINATION bin)
  install(FILES clientmanager.conf.dist DESTINATION ${CONF_DIR})
elseif( WIN32 )
  install(TARGETS clientmanager DESTINATION "${CMAKE_INSTALL_PREFIX}")
  install(FILES clientmanager.conf.dist DESTINATION "${CMAKE_INSTALL_PREFIX}")
endif()
