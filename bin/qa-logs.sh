qa-logs() {
    local LOG_PATH="/var/apps/strangler/current/log/qa.log"
    local SERVER1="deploy@qa-strangler-01"
    local SERVER2="deploy@qa-strangler-02"
    local SERVER3="deploy@qa-strangler-03"
    local SERVER4="deploy@qa-strangler-04"
    local SERVER5="deploy@qa-strangler-05"

    # Run tail on each server in parallel
    echo -e "$SERVER1\n$SERVER2\n$SERVER3\n$SERVER4\n$SERVER5" | xargs -I {} -P 5 ssh {} "tail -f $LOG_PATH"
}