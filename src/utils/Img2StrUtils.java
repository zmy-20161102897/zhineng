package utils;

import com.mchange.util.Base64Encoder;
import com.mchange.util.Base64FormatException;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.Base64;

public class Img2StrUtils {

    private static Base64Encoder encoder = new Base64Encoder() {
        @Override
        public String encode(byte[] bytes) {
            Base64.Encoder encoder = Base64.getEncoder();
            String res = encoder.encodeToString(bytes);
            return res;
        }

        @Override
        public byte[] decode(String s) throws Base64FormatException {
            Base64.Decoder decoder = Base64.getDecoder();
            byte[] res = decoder.decode(s);
            return res;
        }
    };

    public static String img2Str(File file,String type) {
        try {
            BufferedImage bi = ImageIO.read(file);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(bi, type, baos);
            return encoder.encode(baos.toByteArray()).trim();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void str2Img(String base64String, String tempPathName, String type) {
        try {
            byte[] bytes1 = encoder.decode(base64String);
            ByteArrayInputStream bais = new ByteArrayInputStream(bytes1);
            BufferedImage bi1 = ImageIO.read(bais);
            File w2 = new File(tempPathName + "." + type);
            if (!w2.exists()) {
                ImageIO.write(bi1, type, w2);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
