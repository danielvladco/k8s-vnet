FROM ligato/vpp-agent:v2.3.0
COPY vl3_nse /bin/cnf-vppagent
RUN rm /opt/vpp-agent/dev/etcd.conf; echo 'Endpoint: "0.0.0.0:9113"' > /opt/vpp-agent/dev/grpc.conf; echo "disabled: true" > /opt/vpp-agent/dev/linux-plugin.conf; echo "disabled: true" > /opt/vpp-agent/dev/telemetry.conf
RUN mkdir -p /etc/vl3-nse/
COPY ./etc/ /etc/
COPY etc/supervisord/supervisord.conf /opt/vpp-agent/dev/supervisor.conf
