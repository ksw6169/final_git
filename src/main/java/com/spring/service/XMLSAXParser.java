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
    
    private StringBuffer sBuffer=null;
    
    private CompanyDTO dto=null;
    
    private HashMap<String, CompanyDTO> companyList = new HashMap<String, CompanyDTO>();

    public XMLSAXParser() {}
    
    public XMLSAXParser(String url) {
        super();
        try {
            parserFactory = SAXParserFactory.newInstance();
            parser = parserFactory.newSAXParser();
            sBuffer=new StringBuffer();
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
		sBuffer.setLength(0);
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
                     
                     //System.out.println(mapDto.getCompany_name());
                  }
			}else {
                companyList.put(dto.getCompany_name(), dto);
                
                //System.out.println(dto.getCompany_name());
             }
		}
		
	}
    
	@Override
	public void characters(char[] str, int start, int len) throws SAXException {
		if(this.startTagName.equals("wkplNm")) {
			String wkplNm="";
			sBuffer.append(new String(str,start,len));
			wkplNm=sBuffer.toString().trim();
			this.dto.setCompany_name(wkplNm);
		}
		if(this.startTagName.equals("dataCrtYm")) {
			String dataCrtYm="";
			sBuffer.append(new String(str,start,len));
			dataCrtYm=sBuffer.toString().trim();
			this.dto.setCompany_code(Integer.parseInt(dataCrtYm));
		}
		if(this.startTagName.equals("seq")) {
			String seq="";
			sBuffer.append(new String(str,start,len));
			seq=sBuffer.toString().trim();
			this.dto.setCompany_no(Integer.parseInt(seq));
		}
		if(this.startTagName.equals("wkplRoadNmDtlAddr")) {
			String wkplRoadNmDtlAddr="";
			sBuffer.append(new String(str,start,len));
			wkplRoadNmDtlAddr=sBuffer.toString().trim();
			this.dto.setCompany_addr(wkplRoadNmDtlAddr);
		}
		if(this.startTagName.equals("errMsg")) {
			sBuffer.append(new String(str,start,len));
			System.out.println("API 에러 : "+sBuffer.toString().trim());
		}
		if(this.startTagName.equals("returnAuthMsg")) {
			sBuffer.append(new String(str,start,len));
			System.out.println("API 에러 내용 : "+sBuffer.toString().trim());
		}
		if(this.startTagName.equals("returnReasonCode")) {
			sBuffer.append(new String(str,start,len));
			System.out.println("API 에러 코드 : "+sBuffer.toString().trim());
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
