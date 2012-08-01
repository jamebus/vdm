/^@LICENSE@$/ {
	print "#"
	while ((getline < "LICENSE.formatted") > 0) {
		printf("# %s\n", $0)
	}
	print "#"
	next
}
/@SVN_BINDIR@/ {
	gsub(/@SVN_BINDIR@/, svn_bindir)
}
{ print }
