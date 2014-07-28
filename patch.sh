tar zxvf unpv12e.tar.gz

find unpv12e -type d | xargs -I{} mkdir -p "/tmp/{}"

# LC_ALL was needed because of weird thing: http://stackoverflow.com/questions/19242275/re-error-illegal-byte-sequence-on-mac-os-x
find unpv12e -type f | xargs -n1 -I{} sh -c 'LC_ALL=C sed '"'"'s/inet_ntop(/inet_ntop_compat(/g'"'"' "{}" > /tmp/{}'
mv /tmp/unpv12e ./unpv12e_patched

# After patching unpv12e_patched/lib/unp.h 
find unpv12e_patched -name "unp.h" | xargs -n1 -I{} cp unp.h "{}"

#mcast_leave.c: Change IPV6_DROP_MEMBERSHIP to IPV6_LEAVE_GROUP
find unpv12e_patched -name "mcast_leave.c" | xargs -n1 -I{} sh -c 'sed '"'"'s/IPV6_DROP_MEMBERSHIP/IPV6_LEAVE_GROUP/g'"'"' "{}" > /tmp/`basename "{}"`; mv /tmp/`basename "{}"` "{}"'
#mcast_join.c: Change IPV6_ADD_MEMBERSHIP to IPV6_JOIN_GROUP
find unpv12e_patched -name "mcast_join.c" | xargs -n1 -I{} sh -c 'sed '"'"'s/IPV6_ADD_MEMBERSHIP/IPV6_JOIN_GROUP/g'"'"' "{}" > /tmp/`basename "{}"`; mv /tmp/`basename "{}"` "{}"'

echo '' > unpv12e_patched/libgai/getnameinfo.c # already defined in OSX
chmod +x unpv12e_patched/configure
chmod +x unpv12e_patched/config.sub
mv unpv12e unpv12e_unpatched
