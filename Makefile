# Set this on the command line.
project_dir?=.
# Override on the command line if needed.
svn_bindir?=/usr/local/bin

all: vdm svn_load_dirs

vdm: t.awk LICENSE.formatted vdm.in
	awk -f t.awk < vdm.in > vdm

svn_load_dirs: svn_load_dirs.in
	awk -v svn_bindir=${svn_bindir} -f t.awk < svn_load_dirs.in > svn_load_dirs

LICENSE.formatted: LICENSE
	fmt -c < LICENSE > LICENSE.formatted

install: vdm svn_load_dirs
	install -m 0555 vdm ${project_dir}
	install -m 0644 vdm.conf.sample ${project_dir}
	install -d -m 0755 ${project_dir}/bin
	install -m 0555 svn_load_dirs ${project_dir}/bin

clean:
	rm -f vdm LICENSE.formatted svn_load_dirs

.PHONY: all install clean
