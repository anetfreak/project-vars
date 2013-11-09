package com.vars;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {
	
	@RequestMapping(value="/hello.htm")
	public ModelAndView sayHello() {
		ModelAndView modelAndView = new ModelAndView("hello");
		
		modelAndView.addObject("hello", "Vaibhav");
		return modelAndView;
	}

}
