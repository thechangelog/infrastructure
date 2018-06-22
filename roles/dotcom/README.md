[cdn.changelog.com](https://manage.fastly.com/dashboard/services/7gKbcKSKGDyqU7IuDr43eG/datacenters/all) | [netdata.changelog.com](https://netdata.changelog.com)

# Fastly 503 Errors log rule

```
                                                              bytes sent, including headers
                                                              |
                                                       bytes received, including headers
                                                       |      |
                                                 time to serve the request
                                                 |     |      |
                                                 v     v      v
%t %h %H %r %{resp.status}V %{resp.response}V t:%T in:%I out:%O
 ^  ^  ^  ^
 |  |  |  |
 time request was received
    |  |  |
    client IP address
       |  |
       request protocol
          |
          request header
```

| STRING     | DESCRIPTION                                                                                                                                                                                                                                          |
| :---       | :---                                                                                                                                                                                                                                                 |
| %%         | The percent sign.                                                                                                                                                                                                                                    |
| %a         | The client IP address of the request.                                                                                                                                                                                                                |
| %A         | The local IP address.                                                                                                                                                                                                                                |
| %B         | The size of response in bytes, excluding HTTP headers.                                                                                                                                                                                               |
| %b         | The size of response in bytes, excluding HTTP headers. In Common Log Format (CLF), that means a "-" rather than a 0 when no bytes are sent.                                                                                                          |
| %{Foobar}C | The contents of cookie Foobar in the request sent to the server.                                                                                                                                                                                     |
| %D         | The time taken to serve the request, in microseconds.                                                                                                                                                                                                |
| %{FOOBAR}e | The contents of the environment variable FOOBAR. Always returns NIL.                                                                                                                                                                                 |
| %f         | The filename.                                                                                                                                                                                                                                        |
| %h         | The remote IP address.                                                                                                                                                                                                                               |
| %H         | The request protocol.                                                                                                                                                                                                                                |
| %{Foobar}i | The contents of Foobar: header lines in the request sent to the server.                                                                                                                                                                              |
| %I         | Bytes received, including request and headers. Cannot be zero.                                                                                                                                                                                       |
| %k         | The number of keepalive requests handled on this connection. Always returns 0.                                                                                                                                                                       |
| %l         | The remote logname (from identd, if supplied). This will return a dash unless mod_ident is present and IdentityCheck is set On. Always returns "-".                                                                                                  |
| %m         | The request method.                                                                                                                                                                                                                                  |
| %{Foobar}n | The contents of note Foobar from another module. Always returns NIL.                                                                                                                                                                                 |
| %{Foobar}o | The contents of Foobar: header lines in the reply.                                                                                                                                                                                                   |
| %O         | Bytes sent, including headers. Cannot be zero.                                                                                                                                                                                                       |
| %p         | The canonical port of the server serving the request. Always returns 80.                                                                                                                                                                             |
| %{format}p | The canonical port of the server serving the request. Valid formats are canonical, local, or remote. Returns 80 for HTTP requests and 443 for HTTPS requests.                                                                                        |
| %P         | The process ID of the child that serviced the request. Always returns NIL.                                                                                                                                                                           |
| %{format}P | The process ID or thread ID of the child that serviced the request. Valid formats are pid, tid, and hextid. Always returns NIL.                                                                                                                      |
| %q         | The query string (prepended with a ? if a query string exists, otherwise an empty string).                                                                                                                                                           |
| %r         | The first line of the request.                                                                                                                                                                                                                       |
| %R         | The handler generating the response (if any).                                                                                                                                                                                                        |
| %s         | The status. For requests that got internally redirected, this is the status of the original request. Use %>s for the final status.                                                                                                                   |
| %t         | The time the request was received, in Standard English format (e.g., 01/Jan/1970:00:00:00 -0700). The last number indicates the timezone offset from GMT.                                                                                            |
| %T         | The time taken to serve the request, in seconds.                                                                                                                                                                                                     |
| %u         | Always returns "-".                                                                                                                                                                                                                                  |
| %U         | The URL path requested, not including any query string.                                                                                                                                                                                              |
| %v         | The domain name of the request. Equal to %{req.http.host}V.                                                                                                                                                                                          |
| %V         | The same as %v.                                                                                                                                                                                                                                      |
| %{vcl}V    | The literal VCL to include without quoting. This can be used to write VCL variables to your logs (e.g., %{client.geo.country_code}V or %{tls.client.cipher}V). This %-directive is a Fastly extension and is not found in Apache.                    |
| %X         | The connection status when response is completed. Statuses include X (connection aborted before the response completed),  + (connection may be kept alive after the response is sent), and - (connection will be closed after the response is sent). |

* https://docs.fastly.com/guides/streaming-logs/custom-log-formats
* http://my.globaldots.com/knowledgebase.php?action=displayarticle&id=35

