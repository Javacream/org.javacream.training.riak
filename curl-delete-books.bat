@echo off
cls
echo "CREATE BOOK isbn1"
curl -X DELETE http://192.168.186.143:8098/riak/books/G4MYqzuxittsfR46IIIMZQBpT1u
curl -X DELETE http://192.168.186.143:8098/riak/books/isbn1
curl -X DELETE http://192.168.186.143:8098/riak/books/isbn2
curl -X DELETE http://192.168.186.143:8098/riak/books/isbn3
curl -X DELETE http://192.168.186.143:8098/riak/books/isbn4
curl -X DELETE http://192.168.186.143:8098/riak/books/isbn5
curl -X DELETE http://192.168.186.143:8098/riak/books/TOziGQYl8CBEyyBC3VRJGNq3zDH
curl -X DELETE http://192.168.186.143:8098/riak/books/InwAagAg0EzLAVlg3xYEwSHsqg6
curl -X DELETE http://192.168.186.143:8098/riak/books/5F3nxJOxN9ibfCHMhNFRWPD8jl9
curl -X DELETE http://192.168.186.143:8098/riak/books/NSOUiuBdwa2oME88ZB90FqmRTvN
curl -X DELETE http://192.168.186.143:8098/riak/books/8FvHw4wndzTZTmNWu6pSaJSSuX8
echo. 
pause>nul
cls
