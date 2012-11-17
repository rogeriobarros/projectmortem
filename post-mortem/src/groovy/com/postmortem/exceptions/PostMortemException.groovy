package com.postmortem.exceptions

import java.io.Serializable

class PostMortemException extends RuntimeException implements Serializable {

	public PostMortemException(String message) {
		super(message);
	}

}
