function [ MVN ] = tbassembleMatrix( nxt_f,nxt_r,MVNs_f,MVNs_r,MVNs_12,MVNs_13,MVNs_14,...
%Assemblle 16 sub-matrices
%INPUT
% nxt_f,nxt_r           size of the sub-matrices for front (f) and rear (r) wings
% MVNs_f(nxt_f,nxt_f,2) self-influence sub-matrices for front wings
% MVNs_r(nxt_r,nxt_r,2) self-influence sub-matrices for rear wings
% MVNs_11(nxt_f,nxt_f)=MVNs_f(nxt_f,nxt_f,1)
% MVNs_12(nxt_f,nxt_f)
% MVNs_13(nxt_f,nxt_r)
% MVNs_14(nxt_f,nxt_r)
% MVNs_21(nxt_f,nxt_f)
% MVNs_22(nxt_f,nxt_f)=MVNs_f(nxt_f,nxt_f,2)
% MVNs_23(nxt_f,nxt_r)
% MVNs_24(nxt_f,nxt_r)
% MVNs_31(nxt_r,nxt_f)
% MVNs_32(nxt_r,nxt_f)
% MVNs_33(nxt_r,nxt_r)=MVNs_r(nxt_r,nxt_r,1)
% MVNs_34(nxt_r,nxt_r)
% MVNs_41(nxt_r,nxt_f)
% MVNs_42(nxt_r,nxt_f)
% MVNs_43(nxt_r,nxt_r)
% MVNs_44(nxt_r,nxt_r)=MVNs_r(nxt_r,nxt_r,2)
%OUTPUT
% MVN((2*nxt_f+  2*nxt_r), (2*nxt_f+  2*nxt_r))