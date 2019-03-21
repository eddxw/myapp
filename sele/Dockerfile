FROM deinchristian/rpi-selenium-node-chrome-debug:3.14.0
LABEL authors=DeinChristian

USER seluser

#====================================
# Scripts to run Selenium Standalone
#====================================
COPY start-selenium-standalone.sh /opt/bin/start-selenium-standalone.sh

#==============================
# Supervisor configuration file
#==============================
COPY selenium.conf /etc/supervisor/conf.d/

EXPOSE 4444
EXPOSE 5900