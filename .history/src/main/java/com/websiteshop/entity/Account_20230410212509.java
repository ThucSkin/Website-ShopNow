package com.websiteshop.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Accounts")
public class Account implements Serializable, CharSequence {
    @Id
    private String username;
    private String password;
    private String fullname;
    private String email;
    private String image;
    private String address;
    private String telePhone;
    private String reset_password;

    @JsonIgnore
    @OneToMany(mappedBy = "account")
    List<Order> orders;

    @JsonIgnore
    @OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
    List<Authority> authorities;

    @JsonIgnore
    @OneToMany(mappedBy = "account")
    List<Comment> comments;

    @JsonIgnore
    @OneToMany(mappedBy = "account")
    List<Feedback> feedbacks;

    @Override
    public int length() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'length'");
    }

    @Override
    public char charAt(int index) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'charAt'");
    }

    @Override
    public CharSequence subSequence(int start, int end) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'subSequence'");
    }
}
