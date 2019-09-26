package com.phm.shopping.domain;

public class AuthorityVO {
    private int idx;
    private String username;
    private String authority;

    public AuthorityVO() {}

    public AuthorityVO(int idx, String username, String authority) {
        this.idx = idx;
        this.username = username;
        this.authority = authority;
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    @Override
    public String toString() {
        return "AuthorityVO{" +
                "idx=" + idx +
                ", username='" + username + '\'' +
                ", authority='" + authority + '\'' +
                '}';
    }
}
