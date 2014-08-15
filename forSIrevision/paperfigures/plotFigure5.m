rList = [12 16 20 24 28 32];
nl_ion_center = [-12.589581 -9.599121 -7.76663 -6.523974 -5.625410 ...
					  -4.944672];
nl_ion_surf = [-20.717689 -18.543242 -16.981310 -16.099581 -15.315704 ...
					-14.046494];
nl_pair_center = [-0.229630 -0.106110 -0.057766 -0.034927 -0.022729 ...
					  -0.015620];
nl_pair_surf = [-4.090001 -3.935059 -3.635956 -3.573414 -3.439499 ...
					 -3.256403];
l_ion_center = [-13.799944 -10.302387 -8.226548 -6.848190 -5.866261 ...
					 -5.130571];
l_pair_center = [-0.368980 -0.154450 -0.078831 -0.045539 -0.028647 ...
					  -0.019178];
l_ion_surf = [ -34.710544 -32.583135 -30.693269 -29.971210 -29.043307 -26.242789];
l_pair_surf = [ -16.933029  -16.729175 -15.588209  -15.557932 -15.042824 ...
					 -14.319795 ];

plot(rList, nl_ion_center-nl_ion_surf, 'ks-','linewidth',1.8);
hold on;
plot(rList, nl_pair_center-nl_pair_surf, 'ks--','linewidth',1.8);

plot(rList, l_ion_center-l_ion_surf, 'ro-','linewidth',1.8);
plot(rList, l_pair_center-l_pair_surf, 'ro--','linewidth',1.8);