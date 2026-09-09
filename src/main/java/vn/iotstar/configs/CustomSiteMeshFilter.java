package vn.iotstar.configs;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class CustomSiteMeshFilter extends ConfigurableSiteMeshFilter {
    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        builder.addDecoratorPath("/*", "/WEB-INF/decorators/web.jsp")
               .addDecoratorPath("/admin", "/WEB-INF/decorators/admin.jsp")
               .addDecoratorPath("/admin/*", "/WEB-INF/decorators/admin.jsp")
               .addDecoratorPath("/admin/**", "/WEB-INF/decorators/admin.jsp")
               .addExcludedPath("/login*").addExcludedPath("/login/*")
               .addExcludedPath("/alogin*").addExcludedPath("/alogin/*")
               .addExcludedPath("/api/**").addExcludedPath("/api/*")
               .addExcludedPath("/static/**");
    }
}
