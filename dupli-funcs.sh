dupli-loop () {
    local set="${1:-set}" sleep="${2:-3600}";
    while true;
    do
	local log=/var/local/duplicity/log/rsync/$set/$(date +%s);
	echo $log;
	(
	    date;
	    dupli sets list $set | dupli sync time run main || return;
	    date;
	    sleep $sleep;
	) > $log
    done;
}
export -f dupli-loop
