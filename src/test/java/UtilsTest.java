import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class UtilsTest {

    @Test
    public void testIsEmpty() {
        assertTrue(Utils.isEmpty(null));
        assertTrue(Utils.isEmpty("   "));
        assertFalse(Utils.isEmpty("Hello"));
    }
}
