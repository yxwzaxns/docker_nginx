FROM centos:6.6

ADD ./nginx.repo /etc/yum.repos.d/

RUN yum -y update

RUN yum -y install nginx

RUN mkdir /conf && rm -rf /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

ADD . /conf

WORKDIR /conf

ADD ./nginx.conf /etc/nginx/nginx.conf

ADD ./default.conf /etc/nginx/conf.d/

ADD ./8086_nginx.conf /etc/nginx/conf.d/

EXPOSE 80

EXPOSE 8086

RUN chmod a+x /conf/start.sh

CMD ["/conf/start.sh"]
