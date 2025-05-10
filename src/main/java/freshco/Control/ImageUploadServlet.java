package freshco.Control;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class ImageUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// Retrieve the file part from the form using 'ImgUrl'
        Part part = request.getPart("imgUrl"); // 'ImgUrl' should match the file input name in the form
        String fileName = part.getSubmittedFileName(); // Get the file name

        
       // String folderPath = "C:/Users/ext/Desktop/Project201/FreshCoN/src/main/webapp/image"; // Path to the image folder

        
        // Path to save the image file (make sure it points to your desired folder)
        String folderPath = getServletContext().getRealPath("/image"); // The /image folder in your project

        // Create directory if it doesn't exist
        File uploadDir = new File(folderPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Create directories if they don't exist
        }

        // Save the image file in the specified folder
        String filePath = folderPath + File.separator + fileName;
        part.write(filePath); // Save the file to the /image folder

        // Check if the file was uploaded successfully
        File uploadedFile = new File(filePath);
        if (uploadedFile.exists()) {
            System.out.println("File uploaded successfully: " + uploadedFile.getAbsolutePath());
        } else {
            System.out.println("File upload failed.");
        }

        // Generate the image URL (this is the relative path to the image in the project)
        String imageUrl = "./image/" + fileName; // Relative URL to access the image from your website

        response.getWriter().write(imageUrl != null ? imageUrl : "null");
        
        request.setAttribute("imageUrl", imageUrl);
        }
}
