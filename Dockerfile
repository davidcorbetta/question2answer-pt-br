FROM yoanngesquiere/question2answer

WORKDIR /
RUN mkdir -p /tmp

WORKDIR /tmp
RUN git clone https://github.com/amiyasahu/Donut.git \
 && cp -R /tmp/Donut/qa-theme/Donut-theme /var/www/html/qa-theme \
 && cp -R /tmp/Donut/qa-plugin/Donut-admin /var/www/html/qa-plugin \
 && rm -R /tmp/Donut \
 && git clone https://github.com/ganbox/qa-filter.git /var/www/html/qa-plugin/qa-filter \
 && git clone https://github.com/NoahY/q2a-poll.git /var/www/html/qa-plugin/qa-poll \
 && git clone https://github.com/svivian/q2a-user-activity-plus.git /var/www/html/qa-plugin/qa-user-activity \
 && git clone https://github.com/NoahY/q2a-history.git /var/www/html/qa-plugin/qa-user-history \
 && git clone https://github.com/NoahY/q2a-log-tags.git /var/www/html/qa-plugin/qa-log-tags \
 && git clone https://github.com/dunse/qa-category-email-notifications.git /var/www/html/qa-plugin/qa-email-notification \
 && git clone https://github.com/nakov/q2a-plugin-open-questions.git /var/www/html/qa-plugin/qa-questions-open \
 && git clone https://github.com/NoahY/q2a-badges.git /var/www/html/qa-plugin/badges  

WORKDIR /var/www/html/qa-lang
RUN apt-get update \
 && apt-get install unzip \
 && curl -O http://www.question2answer.org/third-party/question2answer-1.7-language-pt-BR.zip \
 && unzip question2answer-1.7-language-pt-BR.zip \
 && rm /var/www/html/qa-lang/question2answer-1.7-language-pt-BR.zip

