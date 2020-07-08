/*
  FUSE: Filesystem in Userspace
  Copyright (C) 2001-2007  Miklos Szeredi <miklos@szeredi.hu>

  This program can be distributed under the terms of the GNU LGPLv2.
  See the file COPYING.LIB.
*/

module c.fuse.fuse_common_compat;

import core.stdc.config;

import std.bitmanip;

import c.fuse.fuse_opt;

/* these definitions provide source compatibility to prior versions.
   Do not include this file directly! */

struct fuse_file_info_compat
{
	int flags;
	c_ulong fh;
	int writepage;
    
    mixin(bitfields!(
        uint, q{direct_io}, 1,
        uint, q{keep_cache}, 1,
        uint, q{__unused}, 30,
    ));
}

int fuse_mount_compat25(const char *mountpoint, fuse_args *args);

int fuse_mount_compat22(const char *mountpoint, const char *opts);

int fuse_mount_compat1(const char *mountpoint, const char** args);

void fuse_unmount_compat22(const char *mountpoint);
