package controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Album;
import model.Artist;
import service.JdbcAlbumDao;
import service.JdbcArtistDao;

/**
 * Servlet implementation class MusicServlet
 */
@WebServlet({"/MusicServlet", ""})
public class MusicServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String base = "/jsp/"; // Set the base folder name to jsp.
		String url = base + "index.jsp"; // set the default url to /jsp/index.jsp.
		String action = request.getParameter("action"); // get the parameter action value.
		HttpSession session = request.getSession();

		if (action != null) 
		{
			//Delete Album-----------------------------------------------------------------------------------------------------------------------------------------
			if(action.compareTo("delete_album")==0) {
				deleteAlbum(request.getParameter("albumId"));
				url = base + "index.jsp";
				
			//Delete Artist-----------------------------------------------------------------------------------------------------------------------------------------
			}else if(action.compareTo("delete_artist")==0) {
				deleteArtist(request.getParameter("artistId"));
				url = base + "/artists/List.jsp";
				
			//Update Album-----------------------------------------------------------------------------------------------------------------------------------------
			}else if(action.compareTo("update_album")==0){
				String albumId = request.getParameter("albumId");
				String title = request.getParameter("title");
				String price = request.getParameter("price");
				String imgUrl = request.getParameter("img_url");
				String genre = request.getParameter("genre");
				String artistId = request.getParameter("artist");
				
				if(genre.compareTo("0") !=0 && artistId.compareTo("0") !=0) {
					updateAlbum(albumId,title,price,imgUrl,genre,artistId);
					session.setAttribute("genreErrorMessage", null);
					session.setAttribute("artistErrorMessage", null);
					url = base + "index.jsp";
				}else {
					//genre
					if(genre.compareTo("0")==0) {
						session.setAttribute("genreErrorMessage", "Invalid Genre");
					}else {
						session.setAttribute("genreErrorMessage", null);
					}
					//artistId
					if(artistId.compareTo("0")==0) {
						session.setAttribute("artistErrorMessage", "Invalid Artist");
					}else {
						session.setAttribute("artistErrorMessage", null);
					}
					url = base + "/albums/Details.jsp";
				}
				
			//Update Artist-----------------------------------------------------------------------------------------------------------------------------------------
			}else if(action.compareTo("update_artist")==0){
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				String artistId = request.getParameter("artistId"); 
				updateArtist(firstName,lastName,artistId);
				url = base + "artists/List.jsp";
				
				
			//Creates New Album-----------------------------------------------------------------------------------------------------------------------------------------
			}else if(action.compareTo("create_album")==0){
				String title = request.getParameter("title");
				String price = request.getParameter("price");
				String genre = request.getParameter("genre");
				String imgUrl = request.getParameter("img_url");
				String artistId = request.getParameter("artist");
				
				if(genre.compareTo("0") !=0 && artistId.compareTo("0") !=0) {
					createAlbum(title,price,genre,imgUrl,artistId);
					session.setAttribute("genreErrorMessage", null);
					session.setAttribute("artistErrorMessage", null);
					url = base + "index.jsp";
				}else {
					//genre
					if(genre.compareTo("0")==0) {
						session.setAttribute("genreErrorMessage", "Invalid Genre");
					}else {
						session.setAttribute("genreErrorMessage", null);
					}
					//artistId
					if(artistId.compareTo("0")==0) {
						session.setAttribute("artistErrorMessage", "Invalid Artist");
					}else {
						session.setAttribute("artistErrorMessage", null);
					}
					url = base + "/albums/New.jsp";
				}
			//Creates New Artist-----------------------------------------------------------------------------------------------------------------------------------------
			}else if(action.compareTo("create_artist")==0){
				
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				
				createArtist(firstName,lastName);
				url = base + "artists/List.jsp";
			}
				
		}
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);

		requestDispatcher.forward(request, response);
	}
	
	//Deletes an album from the database
	private void deleteAlbum(String albumId){
		
		JdbcAlbumDao albumDao = new JdbcAlbumDao(); 
		albumDao.remove(Long.parseLong(albumId));
				
	}
	
	//Delete an Artist from the database
	private void deleteArtist(String artistId){
		
		JdbcArtistDao artistDao = new JdbcArtistDao();
		artistDao.remove(Long.parseLong(artistId));
		
	}
	
	//Updates an Album from the database
	private void updateAlbum(String albumId,String title,String price,String imgUrl,String genre,String artistId ){
		
		Album updatedAlbum = new Album();
		updatedAlbum.setAlbumId(Long.parseLong(albumId));
		updatedAlbum.setTitle(title);
		updatedAlbum.setPrice(Double.parseDouble(price));
		updatedAlbum.setGenre(genre);
		updatedAlbum.setImgUrl(imgUrl);
		updatedAlbum.setArtistId(Long.parseLong(artistId));
		
		JdbcAlbumDao albumDao = new JdbcAlbumDao(); 
		albumDao.update(updatedAlbum);
		
	}
	
	//Updates an Artist from the database
	private void updateArtist(String firstName,String lastName,String artistId){
		
		Artist artistToUpdate = new Artist(); 
		artistToUpdate.setAritstId(Long.parseLong(artistId));
		artistToUpdate.setFirstName(firstName);
		artistToUpdate.setLastName(lastName);
		
		JdbcArtistDao artistDao = new JdbcArtistDao(); 
		artistDao.update(artistToUpdate);
	}
	
	//Creates a new album in the database
	private void createAlbum(String title,String price,String genre,String imgUrl,String artistId){
		
		Album newAlbum = new Album(); 
		newAlbum.setTitle(title);
		newAlbum.setPrice(Double.parseDouble(price));
		newAlbum.setGenre(genre);
		newAlbum.setImgUrl(imgUrl);
		newAlbum.setArtistId(Long.parseLong(artistId));
		
		JdbcAlbumDao albumDao = new JdbcAlbumDao(); 
		albumDao.add(newAlbum);
		
	}
	//Creates a new Artist in the database
	private void createArtist(String firstName,String lastName){
		
		JdbcArtistDao artistDao = new JdbcArtistDao(); 
		artistDao.add(new Artist(firstName, lastName));
	}
	

}
