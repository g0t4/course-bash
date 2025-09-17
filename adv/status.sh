declare -A http_status_codes=(
    [200]="OK"
    [201]="Created"
    [202]="Accepted"
    [204]="No Content"
    [301]="Moved Permanently"
    [302]="Found"
    [304]="Not Modified"
    [400]="Bad Request"
    [401]="Unauthorized"
    [403]="Forbidden"
    [404]="Not Found"
    [405]="Method Not Allowed"
    [409]="Conflict"
    [500]="Internal Server Error"
    [502]="Bad Gateway"
    [503]="Service Unavailable"
    [504]="Gateway Timeout"
)

function get_status_of_url() {
    local url="$1"

    local http_code
    http_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")

    local explain="${http_status_codes[$http_code]:-unknown code}"

    echo "The status was $http_code: $explain"
}
