package com.websiteshop.model;

import java.io.Serializable;
import javax.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FavoriteDto implements Serializable {
	private static final long serialVersionUID = 1L;
	private Long favoriteId;
	private String username;
	private Long productId;
}
