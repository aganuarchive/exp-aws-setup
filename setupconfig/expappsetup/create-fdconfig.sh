export SERVERPORT=8080
export SERVERIP=3.222.116.184
export $APIADDR='$APIADDR'
echo '{' > /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' "configparams": [' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' [{"name":"location_get_url"},{"value":"https://'$APIADDR'.execute-api.us-east-1.amazonaws.com/PROD/locations"}],' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' [{"name":"location_post_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/restapi/locations"}],' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' [{"name":"location_put_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/restapi/locations"}],' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' [{"name":"location_delete_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/restapi/locations?locationid="}],' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' [{"name":"item_get_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/expenseswebapp/itemsapi"}],' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' [{"name":"itemdetail_get_url"},{"value":"https://'$APIADDR'.execute-api.us-east-1.amazonaws.com/PROD/item"}],' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' [{"name":"item_post_url"},{"value":"https://qhtbyssyv7.execute-api.us-east-1.amazonaws.com/prod/items"}],' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' [{"name":"item_put_url"},{"value":"https://'$APIADDR'.execute-api.us-east-1.amazonaws.com/PROD/items"}],' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' [{"name":"item_delete_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/restapi/items?itemid="}],' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' [{"name":"subitem_get_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/expenseswebapp/subitemsapi"}],' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' [{"name":"filter_get_url"},{"value":"https://'$APIADDR'.execute-api.us-east-1.amazonaws.com/PROD/filters"}],' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' [{"name":"category_get_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/expenseswebapp/categoriesapi"}],' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' [{"name":"costcentre_get_url"},{"value":"http://'$SERVERIP':'$SERVERPORT'/expenseswebapp/costcentresapi"}]' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo ' ]' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json
echo '}' >> /opt/tomcat/webapps/expngapp/assets/config/fdconfig.json

