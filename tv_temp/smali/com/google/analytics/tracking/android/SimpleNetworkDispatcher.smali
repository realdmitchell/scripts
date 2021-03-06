.class Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;
.super Ljava/lang/Object;
.source "SimpleNetworkDispatcher.java"

# interfaces
.implements Lcom/google/analytics/tracking/android/Dispatcher;


# instance fields
.field private final ctx:Landroid/content/Context;

.field private gaInstance:Lcom/google/analytics/tracking/android/GoogleAnalytics;

.field private final httpClient:Lorg/apache/http/client/HttpClient;

.field private mOverrideHostUrl:Ljava/net/URL;

.field private final userAgent:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/http/client/HttpClient;Landroid/content/Context;)V
    .locals 1
    .param p1, "httpClient"    # Lorg/apache/http/client/HttpClient;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 78
    invoke-static {p2}, Lcom/google/analytics/tracking/android/GoogleAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/analytics/tracking/android/GoogleAnalytics;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;-><init>(Lorg/apache/http/client/HttpClient;Lcom/google/analytics/tracking/android/GoogleAnalytics;Landroid/content/Context;)V

    .line 79
    return-void
.end method

.method constructor <init>(Lorg/apache/http/client/HttpClient;Lcom/google/analytics/tracking/android/GoogleAnalytics;Landroid/content/Context;)V
    .locals 7
    .param p1, "httpClient"    # Lorg/apache/http/client/HttpClient;
    .param p2, "gaInstance"    # Lcom/google/analytics/tracking/android/GoogleAnalytics;
    .param p3, "ctx"    # Landroid/content/Context;
    .annotation build Lcom/google/android/gms/common/util/VisibleForTesting;
    .end annotation

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->ctx:Landroid/content/Context;

    const-string/jumbo v1, "GoogleAnalytics"

    const-string/jumbo v2, "3.0"

    .line 64
    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Lcom/google/analytics/tracking/android/Utils;->getLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v6, Landroid/os/Build;->ID:Ljava/lang/String;

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->createUserAgentString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->userAgent:Ljava/lang/String;

    .line 72
    iput-object p1, p0, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 74
    iput-object p2, p0, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->gaInstance:Lcom/google/analytics/tracking/android/GoogleAnalytics;

    .line 75
    return-void
.end method

.method private buildRequest(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/HttpEntityEnclosingRequest;
    .locals 6
    .param p1, "params"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 190
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 194
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 195
    .local v1, "full":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x7f4

    if-lt v3, v4, :cond_1

    .line 198
    new-instance v2, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;

    const-string/jumbo v3, "POST"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .local v2, "request":Lorg/apache/http/HttpEntityEnclosingRequest;
    :try_start_0
    new-instance v3, Lorg/apache/http/entity/StringEntity;

    invoke-direct {v3, p1}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v3}, Lorg/apache/http/HttpEntityEnclosingRequest;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    const-string/jumbo v3, "User-Agent"

    .line 207
    iget-object v4, p0, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->userAgent:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Lorg/apache/http/HttpEntityEnclosingRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    return-object v2

    .end local v1    # "full":Ljava/lang/String;
    .end local v2    # "request":Lorg/apache/http/HttpEntityEnclosingRequest;
    :cond_0
    const-string/jumbo v3, "Empty hit, discarding."

    .line 191
    invoke-static {v3}, Lcom/google/analytics/tracking/android/Log;->w(Ljava/lang/String;)V

    .line 192
    return-object v5

    .line 196
    .restart local v1    # "full":Ljava/lang/String;
    :cond_1
    new-instance v2, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;

    const-string/jumbo v3, "GET"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/message/BasicHttpEntityEnclosingRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v2    # "request":Lorg/apache/http/HttpEntityEnclosingRequest;
    goto :goto_0

    .line 205
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string/jumbo v3, "Encoding error, discarding hit"

    .line 203
    invoke-static {v3}, Lcom/google/analytics/tracking/android/Log;->w(Ljava/lang/String;)V

    .line 204
    return-object v5
.end method

.method private logDebugInformation(Lorg/apache/http/HttpEntityEnclosingRequest;)V
    .locals 11
    .param p1, "request"    # Lorg/apache/http/HttpEntityEnclosingRequest;

    .prologue
    .line 217
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 218
    .local v5, "httpHeaders":Ljava/lang/StringBuffer;
    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v8, v0

    .local v8, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_0
    if-lt v6, v8, :cond_1

    .line 221
    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 222
    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    if-nez v9, :cond_2

    .line 238
    :cond_0
    :goto_1
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/google/analytics/tracking/android/Log;->v(Ljava/lang/String;)V

    .line 239
    return-void

    .line 218
    :cond_1
    aget-object v4, v0, v6

    .line 219
    .local v4, "header":Lorg/apache/http/Header;
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 218
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 224
    .end local v4    # "header":Lorg/apache/http/Header;
    :cond_2
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v7

    .line 225
    .local v7, "is":Ljava/io/InputStream;
    if-eqz v7, :cond_0

    .line 226
    invoke-virtual {v7}, Ljava/io/InputStream;->available()I

    move-result v1

    .line 227
    .local v1, "avail":I
    if-lez v1, :cond_0

    .line 228
    new-array v2, v1, [B

    .line 229
    .local v2, "b":[B
    invoke-virtual {v7, v2}, Ljava/io/InputStream;->read([B)I

    const-string/jumbo v9, "POST:\n"

    .line 230
    invoke-virtual {v5, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 231
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v2}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v5, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 236
    .end local v1    # "avail":I
    .end local v2    # "b":[B
    .end local v7    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v3

    .local v3, "e":Ljava/io/IOException;
    const-string/jumbo v9, "Error Writing hit to log..."

    .line 235
    invoke-static {v9}, Lcom/google/analytics/tracking/android/Log;->v(Ljava/lang/String;)V

    goto :goto_1
.end method


# virtual methods
.method createUserAgentString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "product"    # Ljava/lang/String;
    .param p2, "version"    # Ljava/lang/String;
    .param p3, "release"    # Ljava/lang/String;
    .param p4, "language"    # Ljava/lang/String;
    .param p5, "model"    # Ljava/lang/String;
    .param p6, "id"    # Ljava/lang/String;

    .prologue
    const-string/jumbo v0, "%s/%s (Linux; U; Android %s; %s; %s Build/%s)"

    const/4 v1, 0x6

    .line 248
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    const/4 v2, 0x2

    aput-object p3, v1, v2

    const/4 v2, 0x3

    aput-object p4, v1, v2

    const/4 v2, 0x4

    aput-object p5, v1, v2

    const/4 v2, 0x5

    aput-object p6, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public dispatchHits(Ljava/util/List;)I
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/analytics/tracking/android/Hit;",
            ">;)I"
        }
    .end annotation

    .prologue
    .local p1, "hits":Ljava/util/List;, "Ljava/util/List<Lcom/google/analytics/tracking/android/Hit;>;"
    const/4 v9, 0x0

    .line 100
    .local v9, "hitsDispatched":I
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v19

    const/16 v20, 0x28

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 101
    .local v11, "maxHits":I
    const/4 v7, 0x1

    .local v7, "firstSend":Z
    const/4 v10, 0x0

    .line 102
    .local v10, "i":I
    :goto_0
    if-lt v10, v11, :cond_0

    .line 171
    return v9

    .line 103
    :cond_0
    move-object/from16 v0, p1

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/analytics/tracking/android/Hit;

    .line 104
    .local v8, "hit":Lcom/google/analytics/tracking/android/Hit;
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->getUrl(Lcom/google/analytics/tracking/android/Hit;)Ljava/net/URL;

    move-result-object v18

    .line 106
    .local v18, "url":Ljava/net/URL;
    if-eqz v18, :cond_1

    .line 116
    new-instance v17, Lorg/apache/http/HttpHost;

    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->getPort()I

    move-result v20

    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move/from16 v2, v20

    move-object/from16 v3, v21

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 118
    .local v17, "targetHost":Lorg/apache/http/HttpHost;
    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v13

    .line 126
    .local v13, "path":Ljava/lang/String;
    invoke-virtual {v8}, Lcom/google/analytics/tracking/android/Hit;->getHitParams()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v19

    if-nez v19, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    move-wide/from16 v0, v20

    invoke-static {v8, v0, v1}, Lcom/google/analytics/tracking/android/HitBuilder;->postProcessHit(Lcom/google/analytics/tracking/android/Hit;J)Ljava/lang/String;

    move-result-object v12

    .line 129
    .local v12, "params":Ljava/lang/String;
    :goto_1
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->buildRequest(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/HttpEntityEnclosingRequest;

    move-result-object v14

    .line 130
    .local v14, "request":Lorg/apache/http/HttpEntityEnclosingRequest;
    if-eqz v14, :cond_4

    const-string/jumbo v19, "Host"

    .line 134
    invoke-virtual/range {v17 .. v17}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v14, v0, v1}, Lorg/apache/http/HttpEntityEnclosingRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    invoke-static {}, Lcom/google/analytics/tracking/android/Log;->isVerbose()Z

    move-result v19

    if-nez v19, :cond_5

    .line 138
    :goto_2
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x2000

    move/from16 v0, v19

    move/from16 v1, v20

    if-gt v0, v1, :cond_6

    .line 141
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->gaInstance:Lcom/google/analytics/tracking/android/GoogleAnalytics;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/google/analytics/tracking/android/GoogleAnalytics;->isDryRunEnabled()Z

    move-result v19

    if-nez v19, :cond_7

    .line 145
    if-nez v7, :cond_8

    .line 149
    :goto_3
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->httpClient:Lorg/apache/http/client/HttpClient;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-interface {v0, v1, v14}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v15

    .line 150
    .local v15, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v15}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v16

    .line 151
    .local v16, "statusCode":I
    invoke-interface {v15}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v6

    .line 152
    .local v6, "entity":Lorg/apache/http/HttpEntity;
    if-nez v6, :cond_9

    :goto_4
    const/16 v19, 0xc8

    .line 155
    move/from16 v0, v16

    move/from16 v1, v19

    if-ne v0, v1, :cond_a

    .line 169
    .end local v6    # "entity":Lorg/apache/http/HttpEntity;
    .end local v15    # "response":Lorg/apache/http/HttpResponse;
    .end local v16    # "statusCode":I
    :goto_5
    add-int/lit8 v9, v9, 0x1

    .line 102
    .end local v12    # "params":Ljava/lang/String;
    .end local v13    # "path":Ljava/lang/String;
    .end local v14    # "request":Lorg/apache/http/HttpEntityEnclosingRequest;
    .end local v17    # "targetHost":Lorg/apache/http/HttpHost;
    :goto_6
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    .line 107
    :cond_1
    invoke-static {}, Lcom/google/analytics/tracking/android/Log;->isVerbose()Z

    move-result v19

    if-nez v19, :cond_2

    const-string/jumbo v19, "No destination: discarding hit."

    .line 110
    invoke-static/range {v19 .. v19}, Lcom/google/analytics/tracking/android/Log;->w(Ljava/lang/String;)V

    .line 112
    :goto_7
    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    .line 108
    :cond_2
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v20, "No destination: discarding hit: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v8}, Lcom/google/analytics/tracking/android/Hit;->getHitParams()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/google/analytics/tracking/android/Log;->w(Ljava/lang/String;)V

    goto :goto_7

    .restart local v13    # "path":Ljava/lang/String;
    .restart local v17    # "targetHost":Lorg/apache/http/HttpHost;
    :cond_3
    const-string/jumbo v12, ""

    goto/16 :goto_1

    .line 131
    .restart local v12    # "params":Ljava/lang/String;
    .restart local v14    # "request":Lorg/apache/http/HttpEntityEnclosingRequest;
    :cond_4
    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    .line 136
    :cond_5
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->logDebugInformation(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    goto :goto_2

    :cond_6
    const-string/jumbo v19, "Hit too long (> 8192 bytes)--not sent"

    .line 139
    invoke-static/range {v19 .. v19}, Lcom/google/analytics/tracking/android/Log;->w(Ljava/lang/String;)V

    goto :goto_5

    :cond_7
    const-string/jumbo v19, "Dry run enabled. Hit not actually sent."

    .line 142
    invoke-static/range {v19 .. v19}, Lcom/google/analytics/tracking/android/Log;->i(Ljava/lang/String;)V

    goto :goto_5

    .line 146
    :cond_8
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->ctx:Landroid/content/Context;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/google/analytics/tracking/android/GANetworkReceiver;->sendRadioPoweredBroadcast(Landroid/content/Context;)V

    .line 147
    const/4 v7, 0x0

    goto :goto_3

    .line 153
    .restart local v6    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v15    # "response":Lorg/apache/http/HttpResponse;
    .restart local v16    # "statusCode":I
    :cond_9
    invoke-interface {v6}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    .line 167
    .end local v6    # "entity":Lorg/apache/http/HttpEntity;
    .end local v15    # "response":Lorg/apache/http/HttpResponse;
    .end local v16    # "statusCode":I
    :catch_0
    move-exception v5

    .local v5, "e":Lorg/apache/http/client/ClientProtocolException;
    const-string/jumbo v19, "ClientProtocolException sending hit; discarding hit..."

    .line 162
    invoke-static/range {v19 .. v19}, Lcom/google/analytics/tracking/android/Log;->w(Ljava/lang/String;)V

    goto :goto_5

    .line 157
    .end local v5    # "e":Lorg/apache/http/client/ClientProtocolException;
    .restart local v6    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v15    # "response":Lorg/apache/http/HttpResponse;
    .restart local v16    # "statusCode":I
    :cond_a
    :try_start_2
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v20, "Bad response: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-interface {v15}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/google/analytics/tracking/android/Log;->w(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_5

    .line 167
    .end local v6    # "entity":Lorg/apache/http/HttpEntity;
    .end local v15    # "response":Lorg/apache/http/HttpResponse;
    .end local v16    # "statusCode":I
    :catch_1
    move-exception v4

    .line 164
    .local v4, "e":Ljava/io/IOException;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v20, "Exception sending hit: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/google/analytics/tracking/android/Log;->w(Ljava/lang/String;)V

    .line 165
    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/google/analytics/tracking/android/Log;->w(Ljava/lang/String;)V

    .line 166
    return v9
.end method

.method getUrl(Lcom/google/analytics/tracking/android/Hit;)Ljava/net/URL;
    .locals 5
    .param p1, "hit"    # Lcom/google/analytics/tracking/android/Hit;
    .annotation build Lcom/google/android/gms/common/util/VisibleForTesting;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 256
    iget-object v2, p0, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->mOverrideHostUrl:Ljava/net/URL;

    if-nez v2, :cond_0

    .line 260
    invoke-virtual {p1}, Lcom/google/analytics/tracking/android/Hit;->getHitUrlScheme()Ljava/lang/String;

    move-result-object v1

    .line 262
    .local v1, "hitUrlScheme":Ljava/lang/String;
    :try_start_0
    new-instance v3, Ljava/net/URL;

    const-string/jumbo v2, "http:"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string/jumbo v2, "https://ssl.google-analytics.com/collect"

    :goto_0
    invoke-direct {v3, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 257
    .end local v1    # "hitUrlScheme":Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->mOverrideHostUrl:Ljava/net/URL;

    return-object v2

    .restart local v1    # "hitUrlScheme":Ljava/lang/String;
    :cond_1
    :try_start_1
    const-string/jumbo v2, "http://www.google-analytics.com/collect"
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 262
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/net/MalformedURLException;
    const-string/jumbo v2, "Error trying to parse the hardcoded host url. This really shouldn\'t happen."

    .line 269
    invoke-static {v2}, Lcom/google/analytics/tracking/android/Log;->e(Ljava/lang/String;)V

    .line 270
    return-object v4
.end method

.method public okToDispatch()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 83
    iget-object v2, p0, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->ctx:Landroid/content/Context;

    const-string/jumbo v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 85
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 90
    .local v1, "network":Landroid/net/NetworkInfo;
    if-nez v1, :cond_1

    :cond_0
    const-string/jumbo v2, "...no network connectivity"

    .line 91
    invoke-static {v2}, Lcom/google/analytics/tracking/android/Log;->v(Ljava/lang/String;)V

    .line 92
    return v4

    .line 90
    :cond_1
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 94
    const/4 v2, 0x1

    return v2
.end method

.method public overrideHostUrl(Ljava/lang/String;)V
    .locals 2
    .param p1, "hostUrl"    # Ljava/lang/String;
    .annotation build Lcom/google/android/gms/common/util/VisibleForTesting;
    .end annotation

    .prologue
    .line 282
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->mOverrideHostUrl:Ljava/net/URL;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    :goto_0
    return-void

    .line 285
    :catch_0
    move-exception v0

    .local v0, "e1":Ljava/net/MalformedURLException;
    const/4 v1, 0x0

    .line 284
    iput-object v1, p0, Lcom/google/analytics/tracking/android/SimpleNetworkDispatcher;->mOverrideHostUrl:Ljava/net/URL;

    goto :goto_0
.end method
