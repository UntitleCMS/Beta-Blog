@echo off

echo "                      &&&&&&&&&&&&&           "
echo "                      &&&&&&&&&&&&&&&         "
echo "                      &&&&&&&&&&&&&&&         "
echo "                      &&&&&&    &&&&&&        "
echo "                      &&&&&&&&&&&&&&&         "
echo "        &&&&&&&&&&&&&&&&&&&&&&&&&&&&&         "
echo "      &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&       "
echo "    &&&&&&&&&&&&&&&&&&&&&&&&     &&&&&&       "
echo "    &&&&&&      &&&&&&&&&&&&      &&&&&&      "
echo "    &&&&&&      &&&&&&&&&&&&      &&&&&&      "
echo "    &&&&&&&     &&&&&&&&&&&&&&&&&&&&&&&       "
echo "     &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&        "
echo "       &&&&&&&&&&&&&&&&&&&&&&&&&&&&&          "
echo "      &&&&&&&&&&&&&&&&                        "
echo "      &&&&&&    &&&&&&                        "
echo "      &&&&&&&&&&&&&&&&                        "
echo "       &&&&&&&&&&&&&&&                        "
echo "         &&&&&&&&&&&&&                        "
echo "                                              "


docker-compose^
 -f docker-compose.network.yml^
 -f docker-compose.database.mongo.yml^
 -f docker-compose.database.sql-server.yml^
 -f docker-compose.service.gateway.yml^
 -f docker-compose.service.fontend.yml^
 -f docker-compose.service.article.yml^
 -f docker-compose.service.comment.yml^
 -f docker-compose.service.userinfo.yml^
 -f docker-compose.service.auth.yml^
 -f docker-compose.service.image.yml^
 -f docker-compose.service.runner.yml^
 -f docker-compose.slave.runner.yml^
 up --force-recreate --build -d %1

docker image prune -f
