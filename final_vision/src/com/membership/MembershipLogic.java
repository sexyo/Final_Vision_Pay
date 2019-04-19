package com.membership;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class MembershipLogic {
	Logger logger = Logger.getLogger(MembershipLogic.class);
	@Autowired
	MembershipDao membershipDao = null;
	

}
