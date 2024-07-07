function invM = invbc(M)
    D = sqrt(diag(M));
    K = max(D)./D;
    K = diag(K);
    invM = K/(K*M*K)*K;    
return