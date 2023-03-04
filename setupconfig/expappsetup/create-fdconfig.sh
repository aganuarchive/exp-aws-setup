export SERVERPORT=8080
export SERVERIP=3.222.116.184
export $APIADDR='$APIADDR'
echo '{' > fdconfig.json
echo ' "configparams": [' >> fdconfig.json
echo ' [{"name":"location_get_url"},{"value":"https://'$APIADDR'.execute-api.us-east-1.amazonaws.com/PROD/locations"}],' >> fdconfig.json
echo ' [{"name":"location_post_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/restapi/locations"}],' >> fdconfig.json
echo ' [{"name":"location_put_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/restapi/locations"}],' >> fdconfig.json
echo ' [{"name":"location_delete_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/restapi/locations?locationid="}],' >> fdconfig.json
echo ' [{"name":"item_get_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/expenseswebapp/itemsapi"}],' >> fdconfig.json
echo ' [{"name":"itemdetail_get_url"},{"value":"https://'$APIADDR'.execute-api.us-east-1.amazonaws.com/PROD/item"}],' >> fdconfig.json
echo ' [{"name":"item_post_url"},{"value":"https://qhtbyssyv7.execute-api.us-east-1.amazonaws.com/prod/items"}],' >> fdconfig.json
echo ' [{"name":"item_put_url"},{"value":"https://'$APIADDR'.execute-api.us-east-1.amazonaws.com/PROD/items"}],' >> fdconfig.json
echo ' [{"name":"item_delete_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/restapi/items?itemid="}],' >> fdconfig.json
echo ' [{"name":"subitem_get_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/expenseswebapp/subitemsapi"}],' >> fdconfig.json
echo ' [{"name":"filter_get_url"},{"value":"https://'$APIADDR'.execute-api.us-east-1.amazonaws.com/PROD/filters"}],' >> fdconfig.json
echo ' [{"name":"category_get_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/expenseswebapp/categoriesapi"}],' >> fdconfig.json
echo ' [{"name":"costcentre_get_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/expenseswebapp/costcentresapi"}]' >> fdconfig.json
echo ' ]' >> fdconfig.json
echo '}' >> fdconfig.json

