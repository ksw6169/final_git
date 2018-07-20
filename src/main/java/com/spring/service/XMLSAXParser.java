package com.spring.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.spring.dto.CompanyDTO;

public class XMLSAXParser extends DefaultHandler {
	// SAXParserFactory     
    private SAXParserFactory parserFactory;
    
    // SAXParser     
    private SAXParser parser;
    
    // url명
    private String url;
 
    // 시작 태그명
    private String startTagName;
 
    // 끝 태그명
    private String endTagName;
    
    private CompanyDTO dto=null;
    
    private HashMap<String, CompanyDTO> companyList = new HashMap<String, CompanyDTO>();

    public XMLSAXParser() {}
    
    public XMLSAXParser(String url) {
        super();
        try {
            parserFactory = SAXParserFactory.newInstance();
            parser = parserFactory.newSAXParser();
        } catch(Exception e) {
            System.out.println("Exception >> " + e.toString());
        }
        this.url = url;
    }

    @Override
	public void startDocument() throws SAXException {
		//super.startDocument();
	}
    @Override
	public void endDocument() throws SAXException {
		//super.endDocument();
	}

	@Override
	public void startElement(String url, String name, String elementName, Attributes attrs) throws SAXException {
		startTagName = elementName;
		if(this.startTagName.equals("item")) {
			this.dto= new CompanyDTO();
		}
	}
	
	@Override
	public void endElement(String url, String localName, String name) throws SAXException {
		endTagName = name;
		if(this.endTagName.equals("item")) {
			if(companyList.containsKey(dto.getCompany_name())) {
				CompanyDTO mapDto=companyList.get(dto.getCompany_name());
				 if(mapDto.getCompany_code()<dto.getCompany_code()) {
					 mapDto.setCompany_no(dto.getCompany_no());
					 mapDto.setCompany_code(dto.getCompany_code());
                     companyList.put(mapDto.getCompany_name(), mapDto);
                  }
			}else {
                companyList.put(dto.getCompany_name(), dto);
             }
		}
		
	}
    
	@Override
	public void characters(char[] str, int start, int len) throws SAXException {
		if(this.startTagName.equals("wkplNm")) {
			String wkplNm=new String(str,start,len);
			this.dto.setCompany_name(wkplNm);
		}
		if(this.startTagName.equals("dataCrtYm")) {
			String dataCrtYm=new String(str,start,len);
			this.dto.setCompany_code(Integer.parseInt(dataCrtYm));
		}
		if(this.startTagName.equals("seq")) {
			String seq=new String(str,start,len);
			this.dto.setCompany_no(Integer.parseInt(seq));
		}
		if(this.startTagName.equals("wkplRoadNmDtlAddr")) {
			String wkplRoadNmDtlAddr=new String(str,start,len);
			this.dto.setCompany_addr(wkplRoadNmDtlAddr);
		}
	}

	// parse
    public ArrayList<CompanyDTO> parse() {
    	ArrayList<CompanyDTO> list=null;
        try {
            parser.parse(url, this);
            list=new ArrayList<CompanyDTO>();
	        list.addAll(this.companyList.values());
        } catch(Exception e) {
            System.out.println("XMLSAXParser Exception " + e.toString());
        }
        return list;
    }
}
