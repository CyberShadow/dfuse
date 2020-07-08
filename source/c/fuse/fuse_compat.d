/*
  FUSE: Filesystem in Userspace
  Copyright (C) 2001-2007  Miklos Szeredi <miklos@szeredi.hu>

  This program can be distributed under the terms of the GNU LGPLv2.
  See the file COPYING.LIB.
*/

/* these definitions provide source compatibility to prior versions.
   Do not include this file directly! */

module c.fuse.fuse_compat;

import core.stdc.config;
import core.sys.posix.sys.stat;
import core.sys.posix.sys.statvfs;
import core.sys.posix.utime;

import c.fuse.fuse;
import c.fuse.fuse_common_compat;

struct fuse_operations_compat25
{
	int function (const char *, stat_t *) getattr;
	int function (const char *, char *, size_t) readlink;
	int function (const char *, fuse_dirh_t, fuse_dirfil_t) getdir;
	int function (const char *, mode_t, dev_t) mknod;
	int function (const char *, mode_t) mkdir;
	int function (const char *) unlink;
	int function (const char *) rmdir;
	int function (const char *, const char *) symlink;
	int function (const char *, const char *) rename;
	int function (const char *, const char *) link;
	int function (const char *, mode_t) chmod;
	int function (const char *, uid_t, gid_t) chown;
	int function (const char *, off_t) truncate;
	int function (const char *, utimbuf *) utime;
	int function (const char *, fuse_file_info *) open;
	int function (const char *, char *, size_t, off_t,
		     fuse_file_info *) read;
	int function (const char *, const char *, size_t, off_t,
		      fuse_file_info *) write;
	int function (const char *, statvfs_t *) statfs;
	int function (const char *, fuse_file_info *) flush;
	int function (const char *, fuse_file_info *) release;
	int function (const char *, int, fuse_file_info *) fsync;
	int function (const char *, const char *, const char *, size_t, int) setxattr;
	int function (const char *, const char *, char *, size_t) getxattr;
	int function (const char *, char *, size_t) listxattr;
	int function (const char *, const char *) removexattr;
	int function (const char *, fuse_file_info *) opendir;
	int function (const char *, void *, fuse_fill_dir_t, off_t,
			fuse_file_info *) readdir;
	int function (const char *, fuse_file_info *) releasedir;
	int function (const char *, int, fuse_file_info *) fsyncdir;
	void *function () init;
	void function (void *) destroy;
	int function (const char *, int) access;
	int function (const char *, mode_t, fuse_file_info *) create;
	int function (const char *, off_t, fuse_file_info *) ftruncate;
	int function (const char *, stat_t *, fuse_file_info *) fgetattr;
}

fuse *fuse_new_compat25(int fd, fuse_args *args,
			       const fuse_operations_compat25 *op,
			       size_t op_size);

int fuse_main_real_compat25(int argc, char** argv,
			    const fuse_operations_compat25 *op,
			    size_t op_size);

fuse* fuse_setup_compat25(int argc, char** argv,
				 const fuse_operations_compat25 *op,
				 size_t op_size, char **mountpoint,
				 int *multithreaded, int *fd);

void fuse_teardown_compat22(fuse *fuse, int fd, char *mountpoint);

version (FreeBSD) {} else version (NetBSD) {} else {

version (none)
	import core.sys.posix.sys.statfs; // TODO - not in Druntime
else
	struct statfs;

struct fuse_operations_compat22 {
	int function (const char *, stat_t *) getattr;
	int function (const char *, char *, size_t) readlink;
	int function (const char *, fuse_dirh_t, fuse_dirfil_t) getdir;
	int function (const char *, mode_t, dev_t) mknod;
	int function (const char *, mode_t) mkdir;
	int function (const char *) unlink;
	int function (const char *) rmdir;
	int function (const char *, const char *) symlink;
	int function (const char *, const char *) rename;
	int function (const char *, const char *) link;
	int function (const char *, mode_t) chmod;
	int function (const char *, uid_t, gid_t) chown;
	int function (const char *, off_t) truncate;
	int function (const char *, utimbuf *) utime;
	int function (const char *, fuse_file_info_compat *) open;
	int function (const char *, char *, size_t, off_t,
		     fuse_file_info_compat *) read;
	int function (const char *, const char *, size_t, off_t,
		      fuse_file_info_compat *) write;
	int function (const char *, .statfs *) statfs;
	int function (const char *, fuse_file_info_compat *) flush;
	int function (const char *, fuse_file_info_compat *) release;
	int function (const char *, int, fuse_file_info_compat *) fsync;
	int function (const char *, const char *, const char *, size_t, int) setxattr;
	int function (const char *, const char *, char *, size_t) getxattr;
	int function (const char *, char *, size_t) listxattr;
	int function (const char *, const char *) removexattr;
	int function (const char *, fuse_file_info_compat *) opendir;
	int function (const char *, void *, fuse_fill_dir_t, off_t,
			fuse_file_info_compat *) readdir;
	int function (const char *, fuse_file_info_compat *) releasedir;
	int function (const char *, int, fuse_file_info_compat *) fsyncdir;
	void *function () init;
	void function (void *) destroy;
}

fuse* fuse_new_compat22(int fd, const char *opts,
			       const fuse_operations_compat22 *op,
			       size_t op_size);

fuse* fuse_setup_compat22(int argc, char** argv,
				 const fuse_operations_compat22 *op,
				 size_t op_size, char **mountpoint,
				 int *multithreaded, int *fd);

int fuse_main_real_compat22(int argc, char** argv,
			    const fuse_operations_compat22 *op,
			    size_t op_size);

alias fuse_dirfil_t_compat = int function(fuse_dirh_t h, const char *name, int type);
struct fuse_operations_compat2 {
	int function (const char *, stat_t *) getattr;
	int function (const char *, char *, size_t) readlink;
	int function (const char *, fuse_dirh_t, fuse_dirfil_t_compat) getdir;
	int function (const char *, mode_t, dev_t) mknod;
	int function (const char *, mode_t) mkdir;
	int function (const char *) unlink;
	int function (const char *) rmdir;
	int function (const char *, const char *) symlink;
	int function (const char *, const char *) rename;
	int function (const char *, const char *) link;
	int function (const char *, mode_t) chmod;
	int function (const char *, uid_t, gid_t) chown;
	int function (const char *, off_t) truncate;
	int function (const char *, utimbuf *) utime;
	int function (const char *, int) open;
	int function (const char *, char *, size_t, off_t) read;
	int function (const char *, const char *, size_t, off_t) write;
	int function (const char *, .statfs *) statfs;
	int function (const char *) flush;
	int function (const char *, int) release;
	int function (const char *, int) fsync;
	int function (const char *, const char *, const char *,
			    size_t, int) setxattr;
	int function (const char *, const char *, char *, size_t) getxattr;
	int function (const char *, char *, size_t) listxattr;
	int function (const char *, const char *) removexattr;
}

int fuse_main_compat2(int argc, char** argv,
		      const fuse_operations_compat2 *op);

fuse *fuse_new_compat2(int fd, const char *opts,
			      const fuse_operations_compat2 *op);

fuse *fuse_setup_compat2(int argc, char** argv,
				const fuse_operations_compat2 *op,
				char **mountpoint, int *multithreaded, int *fd);

struct fuse_statfs_compat1 {
	c_long block_size;
	c_long blocks;
	c_long blocks_free;
	c_long files;
	c_long files_free;
	c_long namelen;
}

struct fuse_operations_compat1 {
	int function (const char *, stat_t *) getattr;
	int function (const char *, char *, size_t) readlink;
	int function (const char *, fuse_dirh_t, fuse_dirfil_t_compat) getdir;
	int function (const char *, mode_t, dev_t) mknod;
	int function (const char *, mode_t) mkdir;
	int function (const char *) unlink;
	int function (const char *) rmdir;
	int function (const char *, const char *) symlink;
	int function (const char *, const char *) rename;
	int function (const char *, const char *) link;
	int function (const char *, mode_t) chmod;
	int function (const char *, uid_t, gid_t) chown;
	int function (const char *, off_t) truncate;
	int function (const char *, utimbuf *) utime;
	int function (const char *, int) open;
	int function (const char *, char *, size_t, off_t) read;
	int function (const char *, const char *, size_t, off_t) write;
	int function (fuse_statfs_compat1 *) statfs;
	int function (const char *, int) release;
	int function (const char *, int) fsync;
}

enum FUSE_DEBUG_COMPAT1	 = (1 << 1);

fuse *fuse_new_compat1(int fd, int flags,
			      const fuse_operations_compat1 *op);

void fuse_main_compat1(int argc, char** argv,
		       const fuse_operations_compat1 *op);

} // version (FreeBSD) {} else version (NetBSD) {} else
