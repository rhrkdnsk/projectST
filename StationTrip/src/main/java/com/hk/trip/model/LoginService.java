package com.hk.trip.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService implements ILoginService  {

	@Autowired
	private ILoginDao loginDao;
}
