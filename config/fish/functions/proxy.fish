function proxy
  set -gx http_proxy http://proxy.wdf.sap.corp:8080
  set -gx https_proxy http://proxy.wdf.sap.corp:8080
  set -gx ftp_proxy http://proxy.wdf.sap.corp:8080
  set -gx no_proxy cloud.sap,sap.corp,localhost,127.0.0.1,192.168.1.100,192.168.40.17,192.168.40.18,192.168.40.19,10.44.10.16,10.44.10.17,10.44.10.18,10.44.9.1,147.204.8.60,10.44.11.1,10.46.1.63,10.46.1.64,10.46.3.233,10.46.28.254,192.168.64.3,192.168.64.4,192.168.64.5
  set | grep _proxy
end
