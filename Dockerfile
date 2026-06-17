FROM ghcr.io/appleboy/drone-lambda@sha256:5e5a2689782a3722fa0e0cdda6c0f532b64abe17c02d0b6e12197792687e3e48 # 1.3.6

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
