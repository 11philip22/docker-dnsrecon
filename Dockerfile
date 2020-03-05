FROM alpine/git as git-env
RUN git clone https://github.com/darkoperator/dnsrecon.git /dnsrecon

FROM python:3.7
COPY --from=git-env /dnsrecon /dnsrecon
WORKDIR /dnsrecon
RUN pip3 install -r requirements.txt

USER 1000
ENTRYPOINT ["python3", "dnsrecon.py"]