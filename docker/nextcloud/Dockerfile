FROM nextcloud:29.0.5-apache

RUN apt update && \
    apt install -y --no-install-recommends clamav clamav-freshclam ffmpeg ocrmypdf tesseract-ocr tesseract-ocr-deu libreoffice-nogui && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/
