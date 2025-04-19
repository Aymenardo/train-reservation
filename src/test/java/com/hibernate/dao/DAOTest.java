package com.hibernate.dao;

import com.hibernate.entity.User;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class DAOTest {

    @Test
    public void testGetUser() {
        DAO dao = new DAO();

        // Use an existing user nickname from your database
        String testNickname = "aymenardo";

        User user = dao.getUser(testNickname);

        assertNotNull(user, "User should not be null");
        assertEquals(testNickname, user.getUserNickName());
    }
}
