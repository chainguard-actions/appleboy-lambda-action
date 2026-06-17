FROM ghcr.io/appleboy/drone-lambda@sha256:032c5951365ca4e4e376c74eb41cf699413618696eed0111e5cc00d6eec0fbc3 # 1.3.5

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
