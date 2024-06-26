ARG RHCOS_VER
FROM ${RHCOS_VER}
RUN rpm-ostree cliwrap install-to-root /
# Env
ENV ADD_RPM="http://192.168.20.8/patch/kernel-5.14.0-449.17318.el9.x86_64.rpm \
             http://192.168.20.8/patch/kernel-core-5.14.0-449.17318.el9.x86_64.rpm \
             http://192.168.20.8/patch/kernel-headers-5.14.0-449.17318.el9.x86_64.rpm \
             http://192.168.20.8/patch/kernel-modules-5.14.0-449.17318.el9.x86_64.rpm \
             http://192.168.20.8/patch/kernel-modules-extra-5.14.0-449.17318.el9.x86_64.rpm \
             http://192.168.20.8/patch/kernel-modules-core-5.14.0-449.17318.el9.x86_64.rpm \
             http://192.168.20.8/patch/kernel-modules-internal-5.14.0-449.17318.el9.x86_64.rpm \
             http://192.168.20.8/patch/kernel-devel-5.14.0-449.17318.el9.x86_64.rpm"
RUN rpm-ostree install --enablerepo rhel-9-for-x86_64-appstream-eus-rpms --enablerepo  rhel-9-for-x86_64-baseos-eus-rpms --releasever=9.2 gcc openssl-devel  && \
    rpm-ostree override replace ${ADD_RPM} && \
    rpm-ostree cleanup -m && \
    ostree container commit
