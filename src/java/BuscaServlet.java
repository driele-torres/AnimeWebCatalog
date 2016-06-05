import javax.xml.transform.dom.DOMSource;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Transformer;
import java.io.IOException;
import java.io.PrintWriter;
import org.xmldb.api.base.*;
import org.xmldb.api.modules.*;
import org.xmldb.api.*;
import javax.xml.transform.OutputKeys;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="BuscaServlet", urlPatterns={"/BuscaServlet"})
public class BuscaServlet extends HttpServlet {
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String URI = "xmldb:exist://localhost:8088/exist/xmlrpc";
        String driver = "org.exist.xmldb.DatabaseImpl";


        XMLResource res = null;
        Node resNode = null;
        Document doc = null;
        Collection col = null;


        String path = getServletContext().getRealPath("/");
        String XSLFileName = path + "anime.xsl";

        String title;
        String episodes;
        
        try {
            title = request.getParameter("title");
            episodes = request.getParameter("episodes");
        
            if (title == null) title="";
            if (episodes == null) episodes="";
        
        } catch (Exception e) {
            title = "";
            episodes = "";
        
        }        
        try {
            Class cl = Class.forName(driver);
            Database database = (Database) cl.newInstance();
            DatabaseManager.registerDatabase(database);

            // get the collection
            col = DatabaseManager.getCollection(URI + "/db/Anime","admin","admin");

            XQueryService service = (XQueryService) col.getService("XQueryService", "1.0");
            service.setProperty("indent", "yes");
            
            String queryString = "";

            if (!(episodes.equals(""))) {
                service.declareVariable("episodes", "");
                queryString = "for $episodes in //anime/title[text()='"+title+"']/../episodes"+
                        "return update replace $episodes with <episodes>"+episodes+"</episodes>";
                service.query(queryString);
            }
            col.setProperty(OutputKeys.INDENT, "no");
            
        }catch (Exception e) {
            System.err.println("Error Document: "+e.getMessage());
        }
        
        try {
            Class cl = Class.forName(driver);
            Database database = (Database) cl.newInstance();
            DatabaseManager.registerDatabase(database);

            // get the collection
            col = DatabaseManager.getCollection(URI + "/db/Anime","admin","admin");
            res = (XMLResource)col.getResource("AnimeCatalogue.xml");
            resNode = res.getContentAsDOM();
            doc = (Document) resNode;
            
        }catch (Exception e) {
            System.err.println("Error Document: "+e.getMessage());
        }
        DOMSource origDocSource = new DOMSource(doc);
        try {
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            StreamSource stylesheet = new StreamSource(XSLFileName);

            Transformer transformer = transformerFactory.newTransformer(stylesheet);

            NodeList NodeListOfAnime = doc.getElementsByTagName("title");
            /*NodeList*/    
            int anime_quantity = NodeListOfAnime.getLength();
            String prevanime;
            String nextanime;

            for (int i=0;i<anime_quantity; i++){

                Node ActualAnimeNode = NodeListOfAnime.item(i);
                NodeList AnimeChildren = ActualAnimeNode.getChildNodes();
                Node AnimeTitleNode = AnimeChildren.item(0);
                String AnimeTitleValue = AnimeTitleNode.getNodeValue();
                
                 if (title.equals(AnimeTitleValue)) {

                    if (i!=0) {
                        prevanime=NodeListOfAnime.item(i-1).getChildNodes().item(0).getNodeValue();
                    } else {
                        prevanime=NodeListOfAnime.item(anime_quantity-1).getChildNodes().item(0).getNodeValue();
                    }

                    if (i!=(anime_quantity-1)) {
                        nextanime=NodeListOfAnime.item(i+1).getChildNodes().item(0).getNodeValue();
                    } else {
                        nextanime=NodeListOfAnime.item(0).getChildNodes().item(0).getNodeValue();
                    }

                    transformer.setParameter("title", AnimeTitleValue);
                    transformer.setParameter("prevanime", prevanime);
                    transformer.setParameter("nextanime", nextanime);

                    transformer.transform(origDocSource,new StreamResult(out));
                }
            }
        } catch (Exception e) {
            out.println("Exception transformation : "+e.getMessage());
            e.printStackTrace(out);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
