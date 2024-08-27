ARG RHCOS_VER
FROM ${RHCOS_VER}
# Env
ENV ADD_RPM="http://localhost/patch/kernel-5.14.0-312.bisect_v8.el9_4.x86_64.rpm \
             http://localhost/patch/kernel-core-5.14.0-312.bisect_v8.el9_4.x86_64.rpm \
             http://localhost/patch/kernel-devel-5.14.0-312.bisect_v8.el9_4.x86_64.rpm \
             http://localhost/patch/kernel-headers-5.14.0-312.bisect_v8.el9_4.x86_64.rpm \
             http://localhost/patch/kernel-modules-5.14.0-312.bisect_v8.el9_4.x86_64.rpm \
             http://localhost/patch/kernel-modules-core-5.14.0-312.bisect_v8.el9_4.x86_64.rpm \
             http://localhost/patch/kernel-modules-extra-5.14.0-312.bisect_v8.el9_4.x86_64.rpm \
             http://localhost/patch/kernel-modules-internal-5.14.0-312.bisect_v8.el9_4.x86_64.rpm"
RUN rpm-ostree override replace ${ADD_RPM} && \
    rpm-ostree cleanup -m && \
    ostree container commit
