/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author daotr
 */
public class HinhAnh {
    private int idHinhAnh;
    private int idSanPham;
    private String path;
    private String slug;
    private String created_at;

    public HinhAnh() {
    }
    
    public HinhAnh(int idHinhAnh) {
        this.idHinhAnh = idHinhAnh;
    }

    public HinhAnh(int idHinhAnh, int idSanPham, String path, String slug, String created_at) {
        this.idHinhAnh = idHinhAnh;
        this.idSanPham = idSanPham;
        this.path = path;
        this.slug = slug;
        this.created_at = created_at;
    }

    public int getIdHinhAnh() {
        return idHinhAnh;
    }

    public void setIdHinhAnh(int idHinhAnh) {
        this.idHinhAnh = idHinhAnh;
    }

    public int getIdSanPham() {
        return idSanPham;
    }

    public void setIdSanPham(int idSanPham) {
        this.idSanPham = idSanPham;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "HinhAnh{" + "idHinhAnh=" + idHinhAnh + ", idSanPham=" + idSanPham + ", path=" + path + ", slug=" + slug + ", created_at=" + created_at + '}';
    }

    
    
    
}